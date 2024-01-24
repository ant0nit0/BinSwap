import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/background_image.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuild the widget when the language changes
    ref.watch(langProvider);

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
              text: translate('home.buttons.play'),
              isExpanded: false,
              onPressed: () =>
                  navigatorKey.currentState?.pushNamed(Routes.gameScreen),
            ),
            KButton.yellow(
              text: translate('home.buttons.settings'),
              onPressed: () =>
                  navigatorKey.currentState?.pushNamed(Routes.settingsScreen),
            ),
            KButton.green(
              text: translate('home.buttons.about'),
              isExpanded: false,
            ),
          ],
        ).separated(
          separator: const SizedBox(height: kDefaultTinyPadding),
        ),
      );
}
