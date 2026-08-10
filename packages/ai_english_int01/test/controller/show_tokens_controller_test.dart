import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('opens halo four frames early and reveals tokens on schedule', () {
    final _FakePositionPort video = _FakePositionPort();
    final ShowTokensMotionSpec motion = ShowTokensMotionSpec.fromJson(
      <String, Object?>{
        'frameRate': 30,
        'easing': 'cubic-bezier(0.22, 1, 0.36, 1)',
        'translateYPx': -24,
        'focusPulse': <Object?>[1.0, 1.03, 1.0],
        'haloLeadFrames': 4,
        'events': <Object?>[
          <String, Object?>{
            'timeMs': 36000,
            'frame': 1080,
            'role': 'Quantity',
            'tokenId': 't1',
            'text': 'two',
          },
          <String, Object?>{
            'timeMs': 38000,
            'frame': 1140,
            'role': 'Adjective',
            'tokenId': 't2',
            'text': 'blue',
          },
          <String, Object?>{
            'timeMs': 40000,
            'frame': 1200,
            'role': 'HeadNoun',
            'tokenId': 't3',
            'text': 'books',
          },
          <String, Object?>{
            'timeMs': 44000,
            'state': 'COMPLETE',
          },
        ],
      },
    );
    final ShowTokensController controller = ShowTokensController(
      video: video,
      motion: motion,
    )..attach();

    video.moveTo(35867);
    expect(controller.state.activeHaloRole, TokenRole.quantity);

    video.moveTo(36000);
    expect(controller.state.activeHaloRole, isNull);
    expect(controller.state.visibleTokenIds, contains('t1'));

    video.moveTo(44000);
    expect(controller.state.complete, isTrue);
    expect(controller.state.visibleTokenIds, containsAll(<String>['t1', 't2', 't3']));
    controller.dispose();
  });
}

class _FakePositionPort implements InteractiveVideoPort {
  final List<VoidCallback> _listeners = <VoidCallback>[];
  Duration _position = Duration.zero;

  @override
  bool get isPlaying => true;

  @override
  Duration get position => _position;

  void moveTo(int milliseconds) {
    _position = Duration(milliseconds: milliseconds);
    for (final VoidCallback listener in List<VoidCallback>.of(_listeners)) {
      listener();
    }
  }

  @override
  void addPositionListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removePositionListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  Future<void> pause() async {}

  @override
  Future<void> play() async {}

  @override
  Future<void> seekTo(Duration position) async {
    _position = position;
  }
}

