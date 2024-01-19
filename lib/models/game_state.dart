import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/item.dart';

class GameState {
  /// The list of selected bins categories for the current game
  final List<Bin> bins;

  /// The number of columns for the current game
  final int nbCol;

  /// The speed of the items in the game
  final double itemSpeed;

  final List<Item> items;

  const GameState({
    required this.bins,
    required this.items,
    this.itemSpeed = 50,
  }) : nbCol = bins.length;
}
