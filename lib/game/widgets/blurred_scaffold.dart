import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class BlurredScaffold extends StatelessWidget {
  final Widget? child;
  final double bgOpacity;
  final double sigma;
  final EdgeInsets? padding;
  final String? title;
  const BlurredScaffold({
    this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: kDefaultLargePadding,
      vertical: kDefaultSmallPadding,
    ),
    this.bgOpacity = .75,
    this.sigma = 2.5,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(bgOpacity),
          ),
          width: double.infinity,
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: neutralLight,
                        fontSize: 36.0,
                        fontFamily: 'LilitaOne',
                      ),
                ),
                const SizedBox(height: kDefaultSmallPadding),
                const Divider(
                  color: grayBorderColor,
                  thickness: 1.0,
                ),
                const SizedBox(height: kDefaultPadding),
              ],
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}
