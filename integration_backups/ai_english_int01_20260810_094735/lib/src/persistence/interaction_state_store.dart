import '../model/interaction_snapshot.dart';

abstract interface class InteractionStateStore {
  Future<InteractionSnapshot?> read(String key);

  Future<void> write(String key, InteractionSnapshot snapshot);

  Future<void> delete(String key);
}

