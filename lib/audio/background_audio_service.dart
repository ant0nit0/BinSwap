import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundAudioService {
  final AudioPlayer _gameplayAudioPlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.loop);
  final AudioPlayer _nonGameplayAudioPlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.loop);

  static const String _gameplayMusicPath = 'audio/gameplay.mp3';
  static const String _nonGameplayMusicPath = 'audio/background.mp3';

  // Private constructor
  BackgroundAudioService._();

  // Factory constructor
  static Future<BackgroundAudioService> create() async {
    final service = BackgroundAudioService._();
    await service._init();
    return service;
  }

  Future<void> _init() async {
    await _gameplayAudioPlayer.setSource(AssetSource(_gameplayMusicPath));
    await _nonGameplayAudioPlayer.setSource(AssetSource(_nonGameplayMusicPath));
    await _gameplayAudioPlayer.pause();
    await _nonGameplayAudioPlayer.pause();
    await _nonGameplayAudioPlayer.setVolume(1);
    await _gameplayAudioPlayer.setVolume(1);
  }

  Future<void> setGameMusic() async {
    await _nonGameplayAudioPlayer.pause();
    await _gameplayAudioPlayer.resume();
  }

  Future<void> setNonGameMusic() async {
    await _gameplayAudioPlayer.pause();
    await _nonGameplayAudioPlayer.resume();
  }

  Future<void> pauseMusics() async {
    await _gameplayAudioPlayer.pause();
    await _nonGameplayAudioPlayer.pause();
  }

  Future<void> refreshGameMusic() async {
    await _nonGameplayAudioPlayer.pause();
    await _gameplayAudioPlayer.stop();
    await _gameplayAudioPlayer.play(AssetSource(_gameplayMusicPath));
  }

  Future<void> resetGameMusic() async {
    await _gameplayAudioPlayer.stop();
    await _gameplayAudioPlayer.setSource(AssetSource(_gameplayMusicPath));
    await _gameplayAudioPlayer.pause();
  }
}

final backgroundAudioServiceProvider =
    FutureProvider<BackgroundAudioService>((ref) async {
  return BackgroundAudioService.create();
});
