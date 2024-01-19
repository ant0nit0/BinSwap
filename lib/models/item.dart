import 'package:recycling_master/utils/bin_enums.dart';

class Item {
  final int score;
  final String name;
  final BinCategory category;

  Item({
    required this.name,
    required this.category,
    this.score = 5,
  });
}
