import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep1 extends HookConsumerWidget {
  const TutorialStep1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final t2AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultLargePadding)
              .copyWith(top: kDefaultLargePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KAnimate(
                controller: t1AnimationController,
                slideDirection: SlideDirection.downToUp,
                child: Text(
                  translate('game.tuto.1.title'),
                  style: ts,
                ),
              ),
              const SizedBox(height: kDefaultSmallPadding),
              KAnimate(
                controller: t2AnimationController,
                slideDirection: SlideDirection.downToUp,
                child: Text(
                  translate('game.tuto.1.description'),
                  style: ts,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              NextButtonWidget(
                controller: t2AnimationController,
                beforeAnimationCallback: () => t1AnimationController.reverse(),
                afterAnimationCallback: () {
                  ref.read(tutorialStateNotifierProvider.notifier).nextStep();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
