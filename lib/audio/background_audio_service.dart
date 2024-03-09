import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundAudioService extends WidgetsBindingObserver {
  final AudioPlayer _backgroundAudioPlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.loop);

  static const String _musicPath = 'audio/background.mp3';

  // Private constructor
  BackgroundAudioService._();

  // Factory constructor
  static Future<BackgroundAudioService> create() async {
    final service = BackgroundAudioService._();
    await service._init();
    return service;
  }

  Future<void> _init() async {
    WidgetsBinding.instance.addObserver(this);
    await _backgroundAudioPlayer.play(AssetSource(_musicPath));
    await _backgroundAudioPlayer.setVolume(1);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        // App is in the background or terminated, pause the music
        pauseBackgroundMusic();
        break;
      case AppLifecycleState.resumed:
        // App is in the foreground, resume the music if needed
        resumeBackgroundMusic();
        break;
    }
  }

  Future<void> refreshBackgroundMusic() async {
    await _backgroundAudioPlayer.stop();
    await _backgroundAudioPlayer.play(AssetSource(_musicPath));
  }

  Future<void> pauseBackgroundMusic() async {
    await _backgroundAudioPlayer.pause();
  }

  Future<void> resumeBackgroundMusic() async {
    await _backgroundAudioPlayer.resume();
  }
}

final backgroundAudioServiceProvider =
    FutureProvider<BackgroundAudioService>((ref) async {
  return BackgroundAudioService.create();
});
