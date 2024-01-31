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
      onLongPress: () =>
          navigatorKey.currentState!.pushNamed(Routes.devSettingsScreen),
      child: Column(
        children: [
          Text(
            'Game developped by Dev2A\nfor the Flutter Global Games',
            style: textStyle,
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
