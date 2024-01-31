import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/audio/background_audio_state_notifier.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/widgets_utils.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onFirstBuild(() async {
      // Initialize the background audio service
      ref.read(backgroundAudioStateNotifierProvider.notifier);
      // Iniitalize the language (if a preference is stored and is different than the device default language)
      unawaited(ref.read(langProvider.notifier).initLang(context));
    });
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the home screen
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.homeScreen,
        (route) => false,
      );
    });

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
