import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/audio/background_audio_state_notifier.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/providers/selected_background.dart';
import 'package:recycling_master/ui/widgets/background_image.dart';
import 'package:recycling_master/ui/widgets/home_title.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/widgets_utils.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingFullWidth = MediaQuery.of(context).size.width * .75;
    final fakeLoadingAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final fakeLoadingAnimation = fakeLoadingAnimationController.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ).chain(CurveTween(curve: Curves.easeInOutExpo)),
    );

    final textAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final showTutorial = useState(false);
    // We get the highscore in order to know if the user as already played the game
    // If not, we show the onBoarding
    final highScore = ref.watch(leaderboardProvider);
    final coins = ref.watch(coinsProvider);

    onFirstBuild(() async {
      // Initialize the background audio service
      ref.read(backgroundAudioStateNotifierProvider.notifier);
      // Iniitalize the language (if a preference is stored and is different than the device default language)
      unawaited(ref.read(langProvider.notifier).initLang(context));
      // Load the color distributions preferences
      ref.read(binColorsProvider.notifier);
      // Load selected background
      ref.read(selectedBackgroundProvider.notifier);
    });

    coins.whenData((value) =>
        value > 0 ? showTutorial.value = false : showTutorial.value = true);
    highScore.whenData((value) =>
        value.isEmpty ? showTutorial.value = true : showTutorial.value = false);

    if (!fakeLoadingAnimationController.isAnimating &&
        !fakeLoadingAnimationController.isCompleted) {
      fakeLoadingAnimationController.forward().then((value) async => {
            // Navigate to the home screen
            navigatorKey.currentState!.pushReplacementNamed(
                showTutorial.value ? Routes.onBoarding : Routes.homeScreen,
                arguments: true)
          });
    }

    return Scaffold(
      body: Stack(
        children: [
          const Hero(tag: 'splash_bg', child: BackgroundImage('home')),
          Positioned(
            bottom: kDefaultPadding,
            left: kDefaultLargePadding,
            right: kDefaultLargePadding,
            top: kDefaultLargePadding * 3,
            child: Column(
              children: [
                KAnimate(
                  controller: textAnimationController,
                  delay: 500,
                  child: const Hero(tag: 'home_title', child: HomeTitle()),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kDefaultLargePadding * 2,
            left: (MediaQuery.of(context).size.width - loadingFullWidth) / 2,
            child: Container(
              decoration: BoxDecoration(
                color: neutralDark,
                borderRadius: BorderRadius.circular(kDefaultSmallPadding),
              ),
              height: 16.0,
              width: loadingFullWidth,
            ),
          ),
          Positioned(
            bottom: kDefaultLargePadding * 2 + 16.0 + kDefaultSmallPadding,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: fakeLoadingAnimation,
              builder: (context, child) {
                return Text(
                  'Loading : ${(fakeLoadingAnimation.value * 100).round()}%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0, color: neutralLight),
                );
              },
            ),
          ),
          Positioned(
            bottom: kDefaultLargePadding * 2,
            left: (MediaQuery.of(context).size.width - loadingFullWidth) / 2,
            child: AnimatedBuilder(
              animation: fakeLoadingAnimation,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    color: neutralLight,
                    borderRadius: BorderRadius.circular(kDefaultSmallPadding),
                  ),
                  height: 16.0,
                  width: fakeLoadingAnimation.value * loadingFullWidth,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
