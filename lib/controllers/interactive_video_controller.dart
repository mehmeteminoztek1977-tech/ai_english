import 'package:video_player/video_player.dart';
import '../models/interaction_spec.dart';

class InteractiveVideoController {
  final VideoPlayerController playerController;
  final InteractionSpec interactionSpec;
  final Function() onInteractionTriggered;
  
  bool _hasTriggered = false;

  InteractiveVideoController({
    required this.playerController,
    required this.interactionSpec,
    required this.onInteractionTriggered,
  }) {
    playerController.addListener(_checkPosition);
  }

  void _checkPosition() {
    if (_hasTriggered) return;

    final currentPosition = playerController.value.position.inMilliseconds;
    final targetPosition = interactionSpec.pauseAtMs;
    const tolerance = 50; // +50 ms tolerans

    if (currentPosition >= targetPosition && currentPosition <= targetPosition + tolerance) {
      _hasTriggered = true;
      playerController.pause();
      onInteractionTriggered();
    }
  }

  void dispose() {
    playerController.removeListener(_checkPosition);
  }
}