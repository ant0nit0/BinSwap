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
        left: 0,
        right: 0,
        child: Column(
          children: [
            KButton.blue(
              text: 'Play',
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
            ),
          ],
        ).separated(
          separator: const SizedBox(height: kDefaultTinyPadding),
        ),
      );
}
