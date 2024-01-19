import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/background_image.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage('home'),
          _buttons(context),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context) => Positioned(
        bottom: kDefaultSmallPadding,
        left: kDefaultLargePadding,
        right: kDefaultLargePadding,
        child: Column(
          children: [
            KButton.blue(
              text: 'Play',
              isExpanded: false,
              onPressed: () =>
                  navigatorKey.currentState?.pushNamed(Routes.gameScreen),
            ),
            KButton.yellow(
              text: 'Settings',
              onPressed: () =>
                  navigatorKey.currentState?.pushNamed(Routes.settingsScreen),
            ),
            const KButton.green(
              text: 'About',
              isExpanded: false,
            ),
          ],
        ).separated(
          separator: const SizedBox(height: kDefaultTinyPadding),
        ),
      );
}
