import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bin_colors.g.dart';

@Riverpod(keepAlive: true)
class BinColors extends _$BinColors {
  static const base = {
    BinCategory.papers: BinColor.orange,
    BinCategory.plastics: BinColor.blue,
    BinCategory.glass: BinColor.gray,
    BinCategory.textiles: BinColor.purple,
    BinCategory.organics: BinColor.green,
    BinCategory.electronics: BinColor.red,
  };
  @override
  FutureOr<Map<BinCategory, BinColor>> build() async {
    await _loadPreferences();
    return state.value ?? base;
  }

  Map<String, String> convertEnumMapToStringMap(
      Map<BinCategory, BinColor> map) {
    return map.map((key, value) => MapEntry(
        key.toString().split('.').last, value.toString().split('.').last));
  }

  Future<void> _loadPreferences() async {
    state = const AsyncLoading();
    final colorsString = await ref
        .read(storageServiceProvider)
        .storage
        .read(key: StorageKeys.colors);

    if (colorsString != null) {
      final colorsMap = json.decode(colorsString) as Map<String, dynamic>;
      Map<BinCategory, BinColor> colors = colorsMap.map((key, value) {
        // Convert the string keys and values back to their respective enums
        final category = BinCategory.values.firstWhere((e) => e.name == key);
        final color = BinColor.values.firstWhere((e) => e.name == value);
        return MapEntry(category, color);
      });
      state = AsyncData(colors);
    } else {
      state = const AsyncData(base);
    }
  }

  BinColor getBinColor(BinCategory category) {
    if (!state.hasValue) {
      return base[category]!;
    }
    return state.requireValue[category]!;
  }

  Color getColor(BinCategory category) {
    return getColorFromBinColor(getBinColor(category));
  }

  Future<void> reset() async {
    state = const AsyncData(base);
    await _storePreferences();
  }

  /// Set a new [color] for the given [category].
  ///
  /// The function automatically assign the previous color to the category
  /// that previously had the [color].
  void setColor(BinCategory category, BinColor color) {
    final newState = Map<BinCategory, BinColor>.from(
        state.requireValue); // Create a new map from the current state
    final previousCategory = newState.entries
        .firstWhere(
          (element) => element.value == color,
        )
        .key;

    newState[previousCategory] = newState[category]!;

    newState[category] = color;

    state = AsyncData(newState); // Assign the new map to the state
    _storePreferences();
  }

  Future<void> _storePreferences() async {
    // Convert your enum map to a string map
    Map<String, String> stringMap =
        convertEnumMapToStringMap(state.requireValue);

    // Encode the string map to JSON
    String jsonString = json.encode(stringMap);

    // Store the JSON string
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.colors, value: jsonString);
  }
}
