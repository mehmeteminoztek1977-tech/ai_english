import 'package:flutter/foundation.dart';

import '../model/interaction_spec.dart';
import '../model/locked_lesson_contract.dart';
import 'interactive_video_controller.dart';

class ShowTokensState {
  const ShowTokensState({
    required this.visibleTokenIds,
    required this.complete,
    this.activeHaloRole,
  });

  const ShowTokensState.initial()
      : visibleTokenIds = const <String>{},
        complete = false,
        activeHaloRole = null;

  final Set<String> visibleTokenIds;
  final bool complete;
  final TokenRole? activeHaloRole;

  @override
  bool operator ==(Object other) {
    return other is ShowTokensState &&
        setEquals(other.visibleTokenIds, visibleTokenIds) &&
        other.complete == complete &&
        other.activeHaloRole == activeHaloRole;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAllUnordered(visibleTokenIds),
        complete,
        activeHaloRole,
      );
}

class ShowTokensController extends ChangeNotifier {
  ShowTokensController({
    required this.video,
    required this.motion,
  });

  final InteractiveVideoPort video;
  final ShowTokensMotionSpec motion;

  ShowTokensState _state = const ShowTokensState.initial();
  bool _attached = false;

  ShowTokensState get state => _state;

  void attach() {
    if (_attached) {
      return;
    }
    video.addPositionListener(_recalculate);
    _attached = true;
    _recalculate();
  }

  void _recalculate() {
    final int currentMs = video.position.inMilliseconds;
    final Set<String> visible = motion.events
        .where((ShowTokenEvent event) => currentMs >= event.timeMs)
        .map((ShowTokenEvent event) => event.tokenId)
        .toSet();

    TokenRole? activeHaloRole;
    for (final ShowTokenEvent event in motion.events) {
      final int haloStartMs = event.timeMs - motion.haloLeadMs;
      if (currentMs >= haloStartMs && currentMs < event.timeMs) {
        activeHaloRole = event.role;
        break;
      }
    }

    final ShowTokensState next = ShowTokensState(
      visibleTokenIds: Set<String>.unmodifiable(visible),
      complete: currentMs >= motion.completeAtMs,
      activeHaloRole: activeHaloRole,
    );
    if (next != _state) {
      _state = next;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    if (_attached) {
      video.removePositionListener(_recalculate);
    }
    super.dispose();
  }
}
