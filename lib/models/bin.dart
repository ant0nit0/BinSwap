import 'package:recycling_master/utils/bin_enums.dart';

class Bin {
  final BinCategory category;
  final BinColor color;
  final String description;
  final String title;

  const Bin({
    required this.category,
    required this.color,
    required this.title,
    required this.description,
  });
}
