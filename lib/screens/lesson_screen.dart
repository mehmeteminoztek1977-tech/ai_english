import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:video_player/video_player.dart';
import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:ai_english_int01/gen_l10n/app_localizations.dart'
    as int01_l10n;

/// CORE-E1-W1-L1 video screen with the locked INT-01 v1.0 bridge.
///
/// [cloudStateStore] must be the adapter backed by the application's existing
/// cloud database. This screen deliberately creates no local persistence.
class LessonScreen extends StatefulWidget {
  const LessonScreen({
    super.key,
    required this.videoController,
    required this.cloudStateStore,
    this.onInt01FlowAction,
    this.autoPlay = false,
    this.disposeVideoController = false,
  });

  /// The controller already selected by the application's video layer.
  final VideoPlayerController videoController;

  /// Existing cloud-backed implementation of [InteractionStateStore].
  final InteractionStateStore cloudStateStore;

  /// Receives locked actions such as `resume_after_INT-01`.
  final ValueChanged<String>? onInt01FlowAction;

  final bool autoPlay;

  /// Set this to true only when this screen owns [videoController].
  final bool disposeVideoController;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  LockedLessonContract? _contract;
  Int01SessionController? _session;
  Object? _initializationError;

  @override
  void initState() {
    super.initState();
    unawaited(_initSession());
  }

  Future<void> _initSession() async {
    Int01SessionController? pendingSession;
    try {
      final LockedLessonContract contract =
          await LockedLessonContract.loadFromAsset();

      if (!widget.videoController.value.isInitialized) {
        await widget.videoController.initialize();
      }

      // In debug mode, we allow shorter videos for easier development.
      // In release mode, the video must be long enough to reach the INT-01 pause point.
      if (!kDebugMode && widget.videoController.value.duration <
          Duration(milliseconds: contract.interaction.pauseAtMs)) {
        throw StateError(
          'Lesson video must reach the locked INT-01 pause point '
          '(${contract.interaction.pauseAtMs} ms). Current video duration: ${widget.videoController.value.duration}.',
        );
      }

      pendingSession = Int01SessionController(
        spec: contract.interaction,
        video: VideoPlayerPort(widget.videoController),
        store: widget.cloudStateStore,
        positiveToleranceMs: contract.flutter.positiveToleranceMs,
      );
      await pendingSession.start();

      if (!mounted) {
        pendingSession.dispose();
        return;
      }

      _contract = contract;
      _session = pendingSession;
      pendingSession = null;
      if (!_session!.interactionVisible) {
        await widget.videoController.play();
      }
      if (mounted) {
        setState(() {
        });
      }
    } on Object catch (error, stackTrace) {
      pendingSession?.dispose();
      if (!mounted) {
        return;
      }
      setState(() {
        _initializationError = error; // Still initialized, but with an error
      });
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'ai_english.lesson_screen',
          context: ErrorDescription('while initializing INT-01 v1.0'),
        ),
      );
    }
  }

  Future<void> _togglePlayback() async {
    final Int01SessionController? session = _session;
    if (session == null || session.interactionVisible) {
      return;
    }
    if (widget.videoController.value.isPlaying) {
      await widget.videoController.pause();
    } else {
      await widget.videoController.play();
    }
  }

  @override
  void dispose() {
    _session?.dispose();
    if (widget.disposeVideoController) {
      unawaited(widget.videoController.dispose());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(builder: (context) {
        if (_initializationError != null) {
          return _InitializationErrorView(
            error: _initializationError!,
          );
        }

        final LockedLessonContract? contract = _contract;
        final Int01SessionController? session = _session;
        if (contract == null || session == null) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _VideoSurface(
              controller: widget.videoController,
              onTogglePlayback: _togglePlayback,
            ),
            Positioned.fill(
              child: _Int01LocalizationScope(
                child: Int01Overlay(
                  session: session,
                  layoutContract: contract.flutter,
                  onFlowAction: (String action) {
                    debugPrint("Flow Action: $action");
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _VideoSurface extends StatelessWidget {
  const _VideoSurface({
    required this.controller,
    required this.onTogglePlayback,
  });

  final VideoPlayerController controller;
  final VoidCallback onTogglePlayback;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTogglePlayback,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}

/// Makes the package's generated TR/EN strings available even when the main
/// application uses its own generated localization class.
class _Int01LocalizationScope extends StatelessWidget {
  const _Int01LocalizationScope({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Locale ambientLocale = Localizations.localeOf(context);
    final Locale int01Locale =
        int01_l10n.AppLocalizations.supportedLocales.firstWhere(
      (Locale locale) => locale.languageCode == ambientLocale.languageCode,
      orElse: () => const Locale('tr'),
    );

    return Localizations.override(
      context: context,
      locale: int01Locale,
      delegates: int01_l10n.AppLocalizations.localizationsDelegates,
      child: child,
    );
  }
}

class _InitializationErrorView extends StatelessWidget {
  const _InitializationErrorView({
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SelectableText(
              'INT-01 başlatılamadı.\n$error',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}