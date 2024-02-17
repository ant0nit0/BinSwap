import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/next_button.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class TutorialStep6 extends HookConsumerWidget {
  final KGame game;
  const TutorialStep6(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);

    const littleTs =
        TextStyle(color: neutralLight, fontSize: 14.0, height: 1.3);
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
                child: const Text(
                  'Well played, you completed the tutorial ! (I\'ve told you it will not be long !)',
                  style: ts,
                ),
              ),
              const SizedBox(height: kDefaultLargePadding),
              KAnimate(
                controller: t2AnimationController,
                slideDirection: SlideDirection.downToUp,
                child: const Text(
                  'You can always redo this tutorial in the home screen, or you can get some help in game by pressing the little I button on the top right of the screen',
                  style: littleTs,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              NextButtonWidget(
                text: 'PLAY',
                controller: t2AnimationController,
                beforeAnimationCallback: () {
                  t1AnimationController.reverse();
                  t2AnimationController.reverse();
                },
                afterAnimationCallback: () {
                  game.launchGameAfterTutorial();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
