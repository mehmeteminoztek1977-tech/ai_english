import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/interaction_snapshot.dart';
import 'interaction_state_store.dart';

class SharedPreferencesInteractionStateStore
    implements InteractionStateStore {
  SharedPreferencesInteractionStateStore(this.preferences);

  final SharedPreferences preferences;

  @override
  Future<InteractionSnapshot?> read(String key) async {
    final String? source = preferences.getString(key);
    if (source == null) {
      return null;
    }
    try {
      final Object? decoded = jsonDecode(source);
      if (decoded is! Map<String, Object?>) {
        return null;
      }
      final InteractionSnapshot snapshot =
          InteractionSnapshot.fromJson(decoded);
      if (snapshot.snapshotVersion != InteractionSnapshot.currentVersion) {
        return null;
      }
      return snapshot;
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> write(String key, InteractionSnapshot snapshot) async {
    final bool saved = await preferences.setString(
      key,
      jsonEncode(snapshot.toJson()),
    );
    if (!saved) {
      throw StateError('Could not persist INT-01 state');
    }
  }

  @override
  Future<void> delete(String key) async {
    final bool removed = await preferences.remove(key);
    if (!removed && preferences.containsKey(key)) {
      throw StateError('Could not remove INT-01 state');
    }
  }
}

