import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

import '../model/interaction_spec.dart';

abstract interface class InteractiveVideoPort {
  Duration get position;

  bool get isPlaying;

  void addPositionListener(VoidCallback listener);

  void removePositionListener(VoidCallback listener);

  Future<void> pause();

  Future<void> play();

  Future<void> seekTo(Duration position);
}

class VideoPlayerPort implements InteractiveVideoPort {
  const VideoPlayerPort(this.controller);

  final VideoPlayerController controller;

  @override
  Duration get position => controller.value.position;

  @override
  bool get isPlaying => controller.value.isPlaying;

  @override
  void addPositionListener(VoidCallback listener) {
    controller.addListener(listener);
  }

  @override
  void removePositionListener(VoidCallback listener) {
    controller.removeListener(listener);
  }

  @override
  Future<void> pause() => controller.pause();

  @override
  Future<void> play() => controller.play();

  @override
  Future<void> seekTo(Duration position) => controller.seekTo(position);
}

class InteractiveVideoController {
  InteractiveVideoController({
    required this.video,
    required this.interactionSpec,
    required this.onInteractionTriggered,
    this.positiveToleranceMs = 50,
  });

  final InteractiveVideoPort video;
  final InteractionSpec interactionSpec;
  final FutureOr<void> Function() onInteractionTriggered;
  final int positiveToleranceMs;

  bool _hasTriggered = false;
  bool _isTriggering = false;
  bool _isAttached = false;
  int? _lastPositionMs;

  bool get hasTriggered => _hasTriggered;

  void attach({bool alreadyTriggered = false}) {
    if (_isAttached) {
      return;
    }
    _hasTriggered = alreadyTriggered;
    _lastPositionMs = video.position.inMilliseconds;
    video.addPositionListener(_checkPosition);
    _isAttached = true;
  }

  void _checkPosition() {
    if (_hasTriggered || _isTriggering) {
      return;
    }
    final int currentMs = video.position.inMilliseconds;
    final int targetMs = interactionSpec.pauseAtMs;
    final int previousMs = _lastPositionMs ?? currentMs;
    _lastPositionMs = currentMs;

    final bool crossedTarget =
        (previousMs < targetMs && currentMs >= targetMs) ||
            (previousMs >= targetMs && currentMs >= targetMs);
    if (crossedTarget) {
      unawaited(_pauseAndTrigger(currentMs));
    }
  }

  Future<void> _pauseAndTrigger(int observedPositionMs) async {
    if (_hasTriggered || _isTriggering) {
      return;
    }
    _isTriggering = true;
    _hasTriggered = true;
    try {
      await video.pause();
      final int targetMs = interactionSpec.pauseAtMs;
      final bool outsidePositiveTolerance = observedPositionMs < targetMs ||
          observedPositionMs > targetMs + positiveToleranceMs;
      if (outsidePositiveTolerance) {
        await video.seekTo(Duration(milliseconds: targetMs));
      }
      await onInteractionTriggered();
    } on Object catch (error, stackTrace) {
      _hasTriggered = false;
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'ai_english_int01',
          context: ErrorDescription('while triggering INT-01'),
        ),
      );
    } finally {
      _isTriggering = false;
    }
  }

  Future<void> normalizePendingInteractionPosition() async {
    final int positionMs = video.position.inMilliseconds;
    final int targetMs = interactionSpec.pauseAtMs;
    await video.pause();
    if (positionMs < targetMs || positionMs > targetMs + positiveToleranceMs) {
      await video.seekTo(Duration(milliseconds: targetMs));
    }
  }

  void resetTrigger() {
    _hasTriggered = false;
    _isTriggering = false;
    _lastPositionMs = video.position.inMilliseconds;
  }

  void dispose() {
    if (_isAttached) {
      video.removePositionListener(_checkPosition);
      _isAttached = false;
    }
  }
}
