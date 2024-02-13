import 'package:flutter/material.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/utils.dart';

class BinColorPickerItem extends StatelessWidget {
  final BinCategory baseCategory;
  final BinColor color;
  final bool isSelected;
  const BinColorPickerItem({
    required this.baseCategory,
    required this.color,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: getColorFromBinColor(color),
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: neutralLight,
                size: 14.0,
              )
            : null,
      ),
    );
  }
}
