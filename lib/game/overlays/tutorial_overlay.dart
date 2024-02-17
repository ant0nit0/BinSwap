import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/tuto_step1.dart';
import 'package:recycling_master/game/widgets/tuto_step2.dart';
import 'package:recycling_master/game/widgets/tuto_step3.dart';
import 'package:recycling_master/game/widgets/tuto_step4.dart';
import 'package:recycling_master/game/widgets/tuto_step5.dart';
import 'package:recycling_master/game/widgets/tutorial_step6.dart';
import 'package:recycling_master/providers/tutorial_state.dart';

enum TutorialStep {
  step1,
  step2,
  step3,
  step3_1,
  step3_2,
  step4,
  step5,
  step6,
}

class TutorialOverlay extends HookConsumerWidget {
  final KGame game;
  const TutorialOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tutorialStateNotifierProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom:
                ref.watch(tutorialStateNotifierProvider.notifier).isDownOnScreen
                    ? null
                    : 0,
            top:
                ref.watch(tutorialStateNotifierProvider.notifier).isDownOnScreen
                    ? 0
                    : null,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: _getHeightFromState(state) *
                  MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
              ),
              child: SingleChildScrollView(child: _getWidgetFromState(state)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getWidgetFromState(TutorialStep state) {
    switch (state) {
      case TutorialStep.step1:
        return const TutorialStep1();
      case TutorialStep.step2:
        return const TutorialStep2();
      case TutorialStep.step3:
        return const TutorialStep3();
      case TutorialStep.step3_1:
        return const TutorialStep3();
      case TutorialStep.step3_2:
        return const TutorialStep3();
      case TutorialStep.step4:
        return const TutorialStep4();
      case TutorialStep.step5:
        return const TutorialStep5();
      case TutorialStep.step6:
        return TutorialStep6(game);
      default:
        return const SizedBox.shrink();
    }
  }

  double _getHeightFromState(TutorialStep state) {
    switch (state) {
      case TutorialStep.step1:
      case TutorialStep.step6:
      case TutorialStep.step3_1:
      case TutorialStep.step3_2:
        return 1;
      case TutorialStep.step2:
        return 0.75;
      case TutorialStep.step3:
        return TutorialStep3.size;
      case TutorialStep.step4:
        return TutorialStep4.size;
      case TutorialStep.step5:
        return TutorialStep5.size;
    }
  }
}
