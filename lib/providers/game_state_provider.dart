import 'package:flutter/material.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state_provider.g.dart';

@Riverpod(keepAlive: true)
class GameStateNotifier extends _$GameStateNotifier {
  @override
  GameState build() {
    initState();
    return state;
  }

  void initState() {
    const bins = sampleBins;
    final categories = bins.map((e) => e.category).toSet();
    final items = allItems
        .where((element) => categories.contains(element.category))
        .toList();
    state = GameState(
      bins: bins,
      items: items,
    );
  }
}
