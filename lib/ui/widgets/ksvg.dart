import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycling_master/utils/colors.dart';

class KSVG extends StatelessWidget {
  static const path = 'assets/images/icons/other/';

  /// The name of the svg file. The file should be in the [path] folder.
  ///
  /// The name should not contain the .svg extension.
  final String name;

  /// The color applied on the svg with a [ColorFilter].
  ///
  /// If null, the [neutralDark] color is used.
  ///
  /// To not apply any color, set [noColor] to true.
  final Color? color;

  /// The width of the svg.
  final double width;

  /// The height of the svg.
  final double height;

  /// If true, the svg will not have any color aand the [color] parameter will be ignored.
  final bool noColor;

  /// The prefix path of the svg.
  ///
  /// If null, the default [path] is used.
  ///
  /// If provided, the [path] is ignored.
  final String? prefixPath;

  /// The border radius of the svg.
  ///
  /// Default is 0.0.
  final double borderRadius;
  const KSVG(
    this.name, {
    this.color,
    this.width = 24.0,
    this.height = 24.0,
    this.borderRadius = 0.0,
    this.noColor = false,
    this.prefixPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) return const SizedBox.shrink();
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SvgPicture.asset(
        '${prefixPath ?? path}$name.svg',
        colorFilter: noColor
            ? null
            : ColorFilter.mode(color ?? neutralDark, BlendMode.srcIn),
        width: width,
        height: height,
      ),
    );
  }
}
