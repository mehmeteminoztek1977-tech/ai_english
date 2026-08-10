import 'package:ai_english_int01/ai_english_int01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fixtures.dart';

void main() {
  testWidgets('restores a pending attempt at the locked pause point',
      (WidgetTester tester) async {
    final InteractionSpec spec = buildInteractionSpec();
    final _MemoryStore store = _MemoryStore();
    final _SessionVideoPort firstVideo = _SessionVideoPort();
    final Int01SessionController first = Int01SessionController(
      spec: spec,
      video: firstVideo,
      store: store,
    );
    await first.start();

    firstVideo.moveTo(50090);
    await tester.pump();
    expect(first.interactionVisible, isTrue);

    first.selectToken('t1');
    first.submitSelection();
    await first.persist();
    expect(first.state.attemptsUsed, 1);
    first.dispose();

    final _SessionVideoPort restoredVideo = _SessionVideoPort();
    final Int01SessionController restored = Int01SessionController(
      spec: spec,
      video: restoredVideo,
      store: store,
    );
    await restored.start();

    expect(restored.interactionVisible, isTrue);
    expect(restored.state.attemptsUsed, 1);
    expect(restoredVideo.position.inMilliseconds, 50000);
    expect(restoredVideo.isPlaying, isFalse);
    restored.dispose();
  });
}

class _MemoryStore implements InteractionStateStore {
  InteractionSnapshot? value;

  @override
  Future<void> delete(String key) async {
    value = null;
  }

  @override
  Future<InteractionSnapshot?> read(String key) async => value;

  @override
  Future<void> write(String key, InteractionSnapshot snapshot) async {
    value = snapshot;
  }
}

class _SessionVideoPort implements InteractiveVideoPort {
  final List<VoidCallback> _listeners = <VoidCallback>[];
  Duration _position = Duration.zero;
  bool _isPlaying = true;

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
    _isPlaying = false;
  }

  @override
  Future<void> play() async {
    _isPlaying = true;
  }

  @override
  Future<void> seekTo(Duration position) async {
    _position = position;
  }
}
