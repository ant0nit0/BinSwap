import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/utils/bin_enums.dart';

class Bin {
  final BinCategory category;
  final BinColor color;
  final String description;
  final String title;
  final List<Item> items;

  const Bin({
    required this.category,
    required this.color,
    required this.title,
    required this.description,
    required this.items,
  });
}
