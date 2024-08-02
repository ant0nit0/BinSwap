import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep3 extends HookConsumerWidget {
  static const size = .5;
  const TutorialStep3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
      child: Column(
        children: [
          KAnimate(
            // slideDirection: SlideDirection.downToUp,
            controller: t1AnimationController,
            child: Text(translate('game.tuto.3'), style: ts),
          ),
          const SizedBox(height: kDefaultPadding),
          NextButtonWidget(
            afterAnimationCallback: () async {
              ref
                  .read(tutorialStateNotifierProvider.notifier)
                  .nextStep(); // Go to 3.1 (full screen, achor bottom)
              t1AnimationController.reverse();
              await Future.delayed(const Duration(milliseconds: 600));
              ref
                  .read(tutorialStateNotifierProvider.notifier)
                  .nextStep(); // Go to 3.2 (full screen, achor top)
              ref
                  .read(tutorialStateNotifierProvider.notifier)
                  .nextStep(); // Go to 4
            },
          ),
        ],
      ),
    );
  }
}
