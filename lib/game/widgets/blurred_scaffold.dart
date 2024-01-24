import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class BlurredScaffold extends StatelessWidget {
  /// Child of the scaffold.
  ///
  /// Will be displayed below the title and a divider.
  final Widget? child;

  /// Opacity of the background (background color is [Colors.black]).
  ///
  /// Default is .75.
  final double bgOpacity;

  /// Sigma of the blur.
  ///
  /// Default is 2.5.
  final double sigma;

  /// Padding of the scaffold.
  ///
  /// Default is [kDefaultLargePadding] horizontally and [kDefaultSmallPadding] vertically.
  final EdgeInsets padding;

  /// Title of the scaffold.
  final String? title;

  /// Function called when the user taps on the close button.
  ///
  /// Should not be null if [automaticallyImplementClosing] is true.
  final Function()? onClose;

  /// If true, the scaffold will automatically have a close button
  /// in the top right corner of the screen.
  ///
  /// This button will call the [onClose] function.
  /// [onClose] should not be null if this is true.
  final bool automaticallyImplementClosing;

  const BlurredScaffold({
    this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: kDefaultLargePadding,
      vertical: kDefaultSmallPadding,
    ),
    this.bgOpacity = .75,
    this.sigma = 2.5,
    this.automaticallyImplementClosing = false,
    this.title,
    this.onClose,
    super.key,
  }) : assert(
          !automaticallyImplementClosing || onClose != null,
          'If automaticallyImplementClosing is true, onClose should not be null',
        );

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
          child: Stack(
            children: [
              if (automaticallyImplementClosing)
                Positioned(
                  top: 0,
                  right: 0,
                  // We set it to top: 0 and right: 0 to use padding instead
                  // This allow users to have a bigger tap detection on the icon
                  child: GestureDetector(
                    onTap: onClose,
                    child: const Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: KSVG(
                        'close',
                        color: neutralLight,
                      ),
                    ),
                  ),
                ),
              Positioned.fill(
                child: Padding(
                  padding: padding,
                  child: Column(
                    children: [
                      if (title != null) ...[
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          title!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
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
            ],
          ),
        ),
      ),
    );
  }
}
