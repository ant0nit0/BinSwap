import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
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

    final confettiController =
        ConfettiController(duration: const Duration(seconds: 1));

    const littleTs =
        TextStyle(color: neutralLight, fontSize: 14.0, height: 1.3);
    final t1AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final t2AnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    useEffect(() {
      confettiController.play();

      return confettiController.dispose;
    }, []);

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultLargePadding)
                        .copyWith(top: kDefaultLargePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KAnimate(
                      controller: t1AnimationController,
                      slideDirection: SlideDirection.downToUp,
                      child: Text(
                        translate('game.tuto.6.top'),
                        style: ts,
                      ),
                    ),
                    const SizedBox(height: kDefaultLargePadding),
                    KAnimate(
                      controller: t2AnimationController,
                      slideDirection: SlideDirection.downToUp,
                      child: Text(
                        translate('game.tuto.6.bottom'),
                        style: littleTs,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    NextButtonWidget(
                      text: translate('game.tuto.6.button'),
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
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            blastDirection: -pi / 2,
            maxBlastForce: 35, // set a lower max blast force
            minBlastForce: 10, // set a lower min blast force
            emissionFrequency: 0.05,
            numberOfParticles: 75, // a lot of particles at once
            gravity: .1,
          ),
        ),
      ],
    );
  }
}
