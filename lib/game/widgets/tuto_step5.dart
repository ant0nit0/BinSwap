import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep5 extends HookConsumerWidget {
  static const size = .35;
  const TutorialStep5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * size -
            2 * kDefaultLargePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            KAnimate(
              slideDirection: SlideDirection.downToUp,
              controller: t1AnimationController,
              child: Text(translate('game.tuto.5.text'), style: ts),
            ),
            const SizedBox(height: kDefaultPadding),
            NextButtonWidget(
              text: translate('game.tuto.5.button'),
              beforeAnimationCallback: () async {
                unawaited(t1AnimationController.reverse());
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
