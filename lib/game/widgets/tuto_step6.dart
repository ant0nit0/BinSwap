import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/game/widgets/snow_info.dart';
import 'package:recycling_master/game/widgets/x2_info.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep6 extends HookConsumerWidget {
  static const size = .55;
  const TutorialStep6({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    final t2AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * size -
        // 2 * kDefaultLargePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            KAnimate(
              slideDirection: SlideDirection.downToUp,
              controller: t1AnimationController,
              child: Text(translate('game.tuto.6.text'), style: ts),
            ),
            const SizedBox(height: kDefaultPadding),
            KAnimate(
              delay: 200,
              slideDirection: SlideDirection.downToUp,
              controller: t2AnimationController,
              child: const Column(
                children: [
                  SnowInfo(isDark: false),
                  SizedBox(height: kDefaultSmallPadding),
                  X2Info(isDark: false),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            NextButtonWidget(
              text: translate('game.tuto.6.button'),
              beforeAnimationCallback: () async {
                unawaited(t1AnimationController.reverse());
                await t2AnimationController.reverse();
              },
              afterAnimationCallback: () {
                ref.read(tutorialStateNotifierProvider.notifier).nextStep();
              },
            ),
          ],
        ),
      ),
    );
  }
}
