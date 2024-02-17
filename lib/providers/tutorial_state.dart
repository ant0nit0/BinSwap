import 'package:recycling_master/game/overlays/tutorial_overlay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial_state.g.dart';

@Riverpod(keepAlive: true)
class TutorialStateNotifier extends _$TutorialStateNotifier {
  @override
  TutorialStep build() {
    state = TutorialStep.step1;

    return state;
  }

  /// The overlay is on the bottom of the screen when the tutorial is before the step 3.2
  bool get isDownOnScreen =>
      state != TutorialStep.step1 &&
      state != TutorialStep.step2 &&
      state != TutorialStep.step3 &&
      state != TutorialStep.step3_1;

  void reset() {
    state = TutorialStep.step1;
  }

  void nextStep() {
    switch (state) {
      case TutorialStep.step1:
        state = TutorialStep.step2;
        break;
      case TutorialStep.step2:
        state = TutorialStep.step3;
        break;
      case TutorialStep.step3:
        state = TutorialStep.step3_1;
        break;
      case TutorialStep.step3_1:
        state = TutorialStep.step3_2;
        break;
      case TutorialStep.step3_2:
        state = TutorialStep.step4;
        break;
      case TutorialStep.step4:
        state = TutorialStep.step5;
        break;
      case TutorialStep.step5:
        state = TutorialStep.step6;
        break;
      case TutorialStep.step6:
        state = TutorialStep.step1;
        break;
    }
  }
}
