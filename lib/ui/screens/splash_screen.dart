import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/audio/background_audio_state_notifier.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/ui/widgets/background_image.dart';
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

    onFirstBuild(() async {
      // Initialize the background audio service
      ref.read(backgroundAudioStateNotifierProvider.notifier);
      // Iniitalize the language (if a preference is stored and is different than the device default language)
      unawaited(ref.read(langProvider.notifier).initLang(context));
      // Load the color distributions preferences
      ref.read(binColorsProvider.notifier);
      // Load the leaderboard
      ref.read(leaderboardProvider.notifier);
    });

    if (!fakeLoadingAnimationController.isAnimating &&
        !fakeLoadingAnimationController.isCompleted) {
      fakeLoadingAnimationController.forward().then((value) => {
            // Navigate to the home screen
            navigatorKey.currentState!.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              (route) => false,
            )
          });
    }

    return Scaffold(
      body: Stack(
        children: [
          const Hero(tag: 'splash_bg', child: BackgroundImage('home')),
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
