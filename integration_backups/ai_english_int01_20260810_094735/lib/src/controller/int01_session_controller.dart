import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../model/interaction_snapshot.dart';
import '../model/interaction_spec.dart';
import '../persistence/interaction_state_store.dart';
import 'interaction_state_machine.dart';
import 'interactive_video_controller.dart';

class Int01SessionController extends ChangeNotifier
    with WidgetsBindingObserver {
  Int01SessionController({
    required this.spec,
    required this.video,
    required this.store,
    this.persistenceKey = 'ai_english.CORE-E1-W1-L1.INT-01.v1',
    this.positiveToleranceMs = 50,
  }) : _machine = InteractionStateMachine(spec: spec) {
    _videoController = InteractiveVideoController(
      video: video,
      interactionSpec: spec,
      positiveToleranceMs: positiveToleranceMs,
      onInteractionTriggered: _handleInteractionTriggered,
    );
  }

  final InteractionSpec spec;
  final InteractiveVideoPort video;
  final InteractionStateStore store;
  final String persistenceKey;
  final int positiveToleranceMs;

  late InteractionStateMachine _machine;
  late final InteractiveVideoController _videoController;
  bool _started = false;
  bool _interactionVisible = false;

  InteractionState get state => _machine.state;

  int get attemptsRemaining => _machine.attemptsRemaining;

  bool get interactionVisible => _interactionVisible;

  Future<void> start() async {
    if (_started) {
      return;
    }
    _started = true;
    WidgetsBinding.instance.addObserver(this);

    final InteractionSnapshot? snapshot = await store.read(persistenceKey);
    if (snapshot != null) {
      _machine = InteractionStateMachine(
        spec: spec,
        initialState: snapshot.state,
      );
    }

    final bool pendingInteraction = state.isTriggered && !state.isResolved;
    _interactionVisible = pendingInteraction;
    _videoController.attach(alreadyTriggered: state.isTriggered);
    if (pendingInteraction) {
      await _videoController.normalizePendingInteractionPosition();
    } else if (snapshot != null) {
      await video.seekTo(
        Duration(milliseconds: snapshot.videoPositionMs),
      );
      if (snapshot.wasPlaying) {
        await video.play();
      }
    }
    notifyListeners();
  }

  void selectToken(String tokenId) {
    _machine.select(tokenId);
    notifyListeners();
    _persistBestEffort();
  }

  void submitSelection() {
    _machine.submit();
    notifyListeners();
    _persistBestEffort();
  }

  void acknowledgeIncorrectFeedback() {
    _machine.acknowledgeIncorrectFeedback();
    notifyListeners();
    _persistBestEffort();
  }

  Future<String?> completeAndResume() async {
    final String? action = state.flowAction;
    _machine.resolve();
    if (!state.isResolved) {
      return null;
    }
    _interactionVisible = false;
    await persist();
    await video.play();
    notifyListeners();
    return action;
  }

  Future<void> persist() async {
    if (!_started) {
      return;
    }
    final InteractionSnapshot snapshot = InteractionSnapshot(
      snapshotVersion: InteractionSnapshot.currentVersion,
      state: state,
      videoPositionMs: video.position.inMilliseconds,
      wasPlaying: video.isPlaying,
      savedAtEpochMs: DateTime.now().millisecondsSinceEpoch,
    );
    await store.write(persistenceKey, snapshot);
  }

  Future<void> reset() async {
    _machine.reset();
    _interactionVisible = false;
    _videoController.resetTrigger();
    await store.delete(persistenceKey);
    notifyListeners();
  }

  Future<void> _handleInteractionTriggered() async {
    _machine.trigger();
    _interactionVisible = true;
    await persist();
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached) {
      _persistBestEffort();
    } else if (state == AppLifecycleState.resumed &&
        interactionVisible) {
      unawaited(_videoController.normalizePendingInteractionPosition());
    }
  }

  @override
  void dispose() {
    _persistBestEffort();
    WidgetsBinding.instance.removeObserver(this);
    _videoController.dispose();
    super.dispose();
  }

  void _persistBestEffort() {
    unawaited(
      persist().onError((Object error, StackTrace stackTrace) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
            library: 'ai_english_int01',
            context: ErrorDescription('while persisting INT-01 state'),
          ),
        );
      }),
    );
  }
}
