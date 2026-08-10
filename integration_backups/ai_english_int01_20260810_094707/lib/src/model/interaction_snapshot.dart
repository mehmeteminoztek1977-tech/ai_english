import '../controller/interaction_state_machine.dart';

class InteractionSnapshot {
  const InteractionSnapshot({
    required this.snapshotVersion,
    required this.state,
    required this.videoPositionMs,
    required this.wasPlaying,
    required this.savedAtEpochMs,
  });

  static const int currentVersion = 1;

  final int snapshotVersion;
  final InteractionState state;
  final int videoPositionMs;
  final bool wasPlaying;
  final int savedAtEpochMs;

  factory InteractionSnapshot.fromJson(Map<String, Object?> json) {
    final Object? rawState = json['state'];
    if (rawState is! Map<String, Object?>) {
      throw const FormatException('Snapshot state must be a JSON object');
    }
    return InteractionSnapshot(
      snapshotVersion: _requiredInt(json, 'snapshotVersion'),
      state: InteractionState.fromJson(rawState),
      videoPositionMs: _requiredInt(json, 'videoPositionMs'),
      wasPlaying: _requiredBool(json, 'wasPlaying'),
      savedAtEpochMs: _requiredInt(json, 'savedAtEpochMs'),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'snapshotVersion': snapshotVersion,
        'state': state.toJson(),
        'videoPositionMs': videoPositionMs,
        'wasPlaying': wasPlaying,
        'savedAtEpochMs': savedAtEpochMs,
      };
}

int _requiredInt(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is int) {
    return value;
  }
  throw FormatException('$key must be an integer');
}

bool _requiredBool(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is bool) {
    return value;
  }
  throw FormatException('$key must be a boolean');
}

