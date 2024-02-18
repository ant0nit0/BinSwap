import 'dart:math';

import 'package:recycling_master/providers/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coins.g.dart';

@Riverpod(keepAlive: true)
class Coins extends _$Coins {
  @override
  FutureOr<int> build() async {
    await _loadFromStorage();
    return state.requireValue;
  }

  Future<void> _loadFromStorage() async {
    state = const AsyncLoading();
    final storage = ref.read(storageServiceProvider).storage;
    final storedCoins = await storage.read(key: StorageKeys.coins);
    if (storedCoins != null) {
      state = AsyncData(int.parse(storedCoins));
    } else {
      state = const AsyncData(0);
    }
  }

  Future<void> _saveToStorage() async {
    if (!state.hasValue) return;
    final storage = ref.read(storageServiceProvider).storage;
    await storage.write(
      key: StorageKeys.coins,
      value: state.requireValue.toString(),
    );
  }

  Future<void> addCoins(int coins) async {
    if (!state.hasValue) return;
    final newState = state.requireValue + coins;
    state = AsyncData(newState);
    await _saveToStorage();
  }

  Future<void> removeCoins(int coins) async {
    if (!state.hasValue) return;
    final newState = max(state.requireValue - coins, 0);
    state = AsyncData(newState);
    await _saveToStorage();
  }
}
