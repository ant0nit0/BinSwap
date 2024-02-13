import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/bin_enums.dart';

class BinImage extends StatelessWidget {
  final BinColor color;
  final BinCategory category;
  const BinImage({
    required this.color,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/icons/bins/${color.name}.png',
          width: 46.0,
          height: 46.0,
        ),
        KSVG(
          category.name,
          width: 18.0,
          height: 18.0,
          prefixPath: 'assets/images/icons/bins/',
        ),
      ],
    );
  }
}
