import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/item.dart';

class GameState {
  /// The list of selected bins categories for the current game
  final List<Bin> bins;

  final List<Item> items;

  const GameState({
    required this.bins,
    required this.items,
  });

  /// The number of columns for the current game
  int get nbCol => bins.length;
}
