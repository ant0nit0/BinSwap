import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/audio/background_audio_state_notifier.dart';
import 'package:recycling_master/utils/router.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // Initialize the background audio service
      ref.read(backgroundAudioStateNotifierProvider.notifier);
      return null;
    }, const []);

    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the home screen
      Navigator.of(context).pushNamedAndRemoveUntil(
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
