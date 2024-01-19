import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';

class RoundedIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  const RoundedIconButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: neutralDark.withOpacity(.1),
          ),
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
