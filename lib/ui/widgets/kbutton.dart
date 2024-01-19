import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class KButton extends StatelessWidget {
  final Color mainColor;

  /// If provided, the color of the button will be a gradient from [mainColor] to [secondaryColor].
  /// If not provided, the color of the button will be [mainColor]
  final Color? secondaryColor;
  final Color shadowColor;
  final String text;
  final VoidCallback? onPressed;
  const KButton({
    required this.mainColor,
    required this.shadowColor,
    required this.text,
    this.onPressed,
    this.secondaryColor,
    super.key,
  });

  const KButton.blue({
    required this.text,
    this.onPressed,
    super.key,
  })  : mainColor = blueMainColor,
        secondaryColor = blueSecondaryColor,
        shadowColor = blueShadowColor;

  const KButton.yellow({
    required this.text,
    this.onPressed,
    super.key,
  })  : mainColor = yellowMainColor,
        secondaryColor = yellowSecondaryColor,
        shadowColor = yellowShadowColor;

  const KButton.green({
    required this.text,
    this.onPressed,
    super.key,
  })  : mainColor = greenMainColor,
        secondaryColor = greenSecondaryColor,
        shadowColor = greenShadowColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
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
              child: InkWell(
                overlayColor: MaterialStateProperty.all(
                  shadowColor.withOpacity(.2),
                ),
                borderRadius: borderRadius,
                onTap: () => onPressed?.call(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultLargePadding * 2,
                    vertical: kDefaultTinyPadding * 1.5,
                  ),
                  child: Text(
                    text,
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
      ],
    );
  }
}
