import 'dart:convert';

import 'package:recycling_master/models/shop_item.dart';
import 'package:recycling_master/models/shop_state.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop.g.dart';

@Riverpod(keepAlive: true)
class Shop extends _$Shop {
  @override
  FutureOr<ShopState> build() async {
    await _loadFromStorage();
    return state.requireValue;
  }

  Future<void> _loadFromStorage() async {
    state = const AsyncLoading();
    final storage = ref.read(storageServiceProvider).storage;
    final storedShopState = await storage.read(key: StorageKeys.shop);
    if (storedShopState != null) {
      final decoded = json.decode(storedShopState);
      try {
        final newState = ShopState.fromJson(decoded);
        state = AsyncData(newState);
      } catch (e) {
        // ignore: avoid_print
        print(e);
        state = AsyncData(ShopState(
            backgrounds: [ShopItem.defaultBGSpring()], characters: []));
      }
    } else {
      state = AsyncData(
          ShopState(backgrounds: [ShopItem.defaultBGSpring()], characters: []));
    }
  }

  Future<void> _saveToStorage() async {
    if (!state.hasValue) return;
    final storage = ref.read(storageServiceProvider).storage;
    await storage.write(
      key: StorageKeys.shop,
      value: json.encode(state.requireValue.toJson()),
    );
  }

  Future<void> addBackground(ShopItem background) async {
    if (!state.hasValue) return;
    final newState = state.requireValue.copyWith(
      backgrounds: [...state.requireValue.backgrounds, background],
    );
    state = AsyncData(newState);
    await _saveToStorage();
  }
}
