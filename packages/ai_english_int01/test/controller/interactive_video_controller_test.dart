import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fixtures.dart';

void main() {
  test('pauses and seeks back when a frame skips beyond +50 ms', () async {
    final _FakeVideoPort video = _FakeVideoPort();
    int triggerCount = 0;
    final InteractiveVideoController controller = InteractiveVideoController(
      video: video,
      interactionSpec: buildInteractionSpec(),
      onInteractionTriggered: () {
        triggerCount += 1;
      },
    )..attach();

    video.moveTo(49980);
    video.moveTo(50090);
    await Future<void>.delayed(Duration.zero);

    expect(video.pauseCount, 1);
    expect(video.seekPositions, <int>[50000]);
    expect(triggerCount, 1);
    controller.dispose();
  });

  test('accepts a pause already inside the positive tolerance', () async {
    final _FakeVideoPort video = _FakeVideoPort();
    int triggerCount = 0;
    final InteractiveVideoController controller = InteractiveVideoController(
      video: video,
      interactionSpec: buildInteractionSpec(),
      onInteractionTriggered: () {
        triggerCount += 1;
      },
    )..attach();

    video.moveTo(49990);
    video.moveTo(50030);
    await Future<void>.delayed(Duration.zero);

    expect(video.pauseCount, 1);
    expect(video.seekPositions, isEmpty);
    expect(triggerCount, 1);
    controller.dispose();
  });
}

class _FakeVideoPort implements InteractiveVideoPort {
  final List<VoidCallback> _listeners = <VoidCallback>[];
  final List<int> seekPositions = <int>[];

  Duration _position = Duration.zero;
  bool _isPlaying = true;
  int pauseCount = 0;

  @override
  bool get isPlaying => _isPlaying;

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
  Future<void> pause() async {
    pauseCount += 1;
    _isPlaying = false;
  }

  @override
  Future<void> play() async {
    _isPlaying = true;
  }

  @override
  Future<void> seekTo(Duration position) async {
    seekPositions.add(position.inMilliseconds);
    _position = position;
  }
}

