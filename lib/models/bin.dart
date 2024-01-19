import 'package:recycling_master/utils/bin_enums.dart';

class Bin {
  final BinCategory category;
  final BinColor color;
  final String? imagePath;

  const Bin({
    required this.category,
    required this.color,
    this.imagePath,
  });
}
