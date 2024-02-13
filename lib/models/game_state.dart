import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/utils/bin_enums.dart';

class GameState {
  /// The list of selected bins categories for the current game
  final List<Bin> bins;

  final List<Item> items;

  final Map<BinCategory, BinColor> colorDistribution;

  const GameState({
    required this.bins,
    required this.items,
    required this.colorDistribution,
  });

  /// The number of columns for the current game
  int get nbCol => bins.length;
}
