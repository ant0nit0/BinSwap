import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep2 extends HookConsumerWidget {
  const TutorialStep2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final t2AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
      child: Column(
        children: [
          KAnimate(
            controller: t1AnimationController,
            slideDirection: SlideDirection.downToUp,
            child: const Text(
                'In the top part, you can find all the informations you need. The score, level progress, elapsed time and of course some settings buttons. ',
                style: ts),
          ),
          const SizedBox(height: kDefaultPadding),
          KAnimate(
            slideDirection: SlideDirection.downToUp,
            controller: t2AnimationController,
            delay: 200,
            child: const Text(
                'If you need some help during the game, you will find all the necessary informations by pressing on the little “i” at the top right of the screen.',
                style: ts),
          ),
          const SizedBox(height: kDefaultPadding),
          NextButtonWidget(
            controller: t2AnimationController,
            beforeAnimationCallback: () async =>
                // We don't need to wait for this animation to finish
                unawaited(t1AnimationController.reverse()),
            afterAnimationCallback: () {
              ref.read(tutorialStateNotifierProvider.notifier).nextStep();
            },
          ),
        ],
      ),
    );
  }
}