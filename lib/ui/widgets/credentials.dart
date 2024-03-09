import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class CredentialsWidget extends StatelessWidget {
  const CredentialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: grayTextLightColor,
          fontFamily: 'Montserrat',
          fontSize: 12.0,
        );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () =>
          navigatorKey.currentState!.pushNamed(Routes.devSettingsScreen),
      child: Column(
        children: [
          Text(
            'Version 1.0.0',
            style: textStyle,
          ),
          const SizedBox(height: kDefaultSmallPadding),
          const Divider(color: grayTextLightColor, height: 1.0),
          const SizedBox(height: kDefaultSmallPadding),
          Text(
            'Game developped by Antoine Andréani\nfor the Flutter Global Games',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDefaultSmallPadding),
          Text(
            'Music by Saraguatos',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
