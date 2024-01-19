import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycling_master/utils/colors.dart';

class KSVG extends StatelessWidget {
  static const path = 'assets/images/icons/other/';
  final String name;
  final Color? color;
  final double width;
  final double height;
  const KSVG(
    this.name, {
    this.color,
    this.width = 24,
    this.height = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$path$name.svg',
      colorFilter: ColorFilter.mode(color ?? neutralDark, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}
