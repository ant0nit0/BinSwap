import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

/// The base of the button used in the app.
/// The button is a [Material] widget with a [InkWell] widget as child.
/// 3 colors are used to create the button:
/// - [mainColor]: the main color of the button
/// - [secondaryColor]: if provided, the color of the button will be a gradient from [mainColor] to [secondaryColor]
/// - [shadowColor]: the color of the shadow of the button placed at the bottom
/// Only [mainColor] is required.
///
/// 3 constructors are provided to create a button with a specific color:
/// - [KButton.blue]
/// - [KButton.yellow]
/// - [KButton.green]
class KButton extends StatelessWidget {
  /// The main color of the button. <br/>
  /// If [secondaryColor] is provided, the color of the button will be a gradient from [mainColor] to [secondaryColor]
  final Color mainColor;

  /// If provided, the color of the button will be a gradient from [mainColor] to [secondaryColor]. <br/>
  /// If not provided, the color of the button will be [mainColor]
  final Color? secondaryColor;

  /// The color of the shadow of the button placed at the bottom. <br/>
  /// The shadow should be a darker version of the [mainColor]. <br/>
  /// If not provided, no shadow will be displayed.
  final Color? shadowColor;

  /// The text of the button
  final String text;

  /// The callback that will be called when the button is pressed.
  final VoidCallback? onPressed;

  /// If true, the button will be expanded to the maximum width of its parent. <br/>
  /// Default to true.
  final bool isExpanded;

  const KButton({
    required this.mainColor,
    required this.text,
    this.onPressed,
    this.secondaryColor,
    this.shadowColor,
    this.isExpanded = true,
    super.key,
  });

  const KButton.blue({
    required this.text,
    this.onPressed,
    this.isExpanded = true,
    super.key,
  })  : mainColor = blueMainColor,
        secondaryColor = blueSecondaryColor,
        shadowColor = blueShadowColor;

  const KButton.yellow({
    required this.text,
    this.onPressed,
    this.isExpanded = true,
    super.key,
  })  : mainColor = yellowMainColor,
        secondaryColor = yellowSecondaryColor,
        shadowColor = yellowShadowColor;

  const KButton.green({
    required this.text,
    this.onPressed,
    this.isExpanded = true,
    super.key,
  })  : mainColor = greenMainColor,
        secondaryColor = greenSecondaryColor,
        shadowColor = greenShadowColor;

  const KButton.red({
    required this.text,
    this.onPressed,
    this.isExpanded = true,
    super.key,
  })  : mainColor = redMainColor,
        secondaryColor = redSecondaryColor,
        shadowColor = redShadowColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    final child = Container(
      padding: const EdgeInsets.only(bottom: kDefaultTinyPadding * 1.5),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: shadowColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: borderRadius,
            gradient: secondaryColor != null
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [mainColor, secondaryColor!],
                  )
                : null,
          ),
          width: isExpanded ? double.infinity : null,
          child: InkWell(
            overlayColor: MaterialStateProperty.all(
              shadowColor == null
                  ? Colors.transparent
                  : shadowColor!.withOpacity(.2),
            ),
            borderRadius: borderRadius,
            onTap: () => onPressed?.call(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: !isExpanded ? kDefaultLargePadding * 2 : 0,
                vertical: kDefaultTinyPadding * 1.5,
              ),
              child: Center(
                child: Text(
                  text,
                  maxLines: 1,
                  style: const TextStyle(
                    fontFamily: 'LilitaOne',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return isExpanded ? child : FittedBox(child: child);
  }
}
