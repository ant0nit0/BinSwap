import 'dart:convert';

import 'package:recycling_master/models/shop_item.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_background.g.dart';

@Riverpod(keepAlive: true)
class SelectedBackground extends _$SelectedBackground {
  @override
  FutureOr<ShopItem> build() async {
    await _loadFromStorage();
    return state.requireValue;
  }

  Future<void> _loadFromStorage() async {
    state = const AsyncLoading();
    final storage = ref.read(storageServiceProvider).storage;
    final storedBackgroundString =
        await storage.read(key: StorageKeys.selectedBackground);
    try {
      final storedBackground = storedBackgroundString != null
          ? ShopItem.fromJson(json.decode(storedBackgroundString))
          : null;
      if (storedBackground != null) {
        state = AsyncData(storedBackground);
      } else {
        state = AsyncData(ShopItem.defaultBGSpring());
      }
    } catch (e) {
      state = AsyncData(ShopItem.defaultBGSpring());
      // ignore: avoid_print
      print(
          'Error while trying to parse selected background from local storage : \n$e');
    }
  }

  Future<void> _saveToStorage() async {
    if (!state.hasValue) return;
    final storage = ref.read(storageServiceProvider).storage;
    await storage.write(
      key: StorageKeys.selectedBackground,
      value: json.encode(state.requireValue),
    );
  }

  Future<void> selectBackground(ShopItem background) async {
    state = AsyncData(background);
    await _saveToStorage();
  }
}
