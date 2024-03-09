import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_master/providers/settings_preferences.dart';

class SfxService {
  final Ref _ref;

  final ValueNotifier<bool> shouldPlaySfx = ValueNotifier(true);

  final AudioPlayer _swipePlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop);
  final AudioPlayer _correctCategoryPlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop);
  final AudioPlayer _newHighScorePlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop);
  final AudioPlayer _gameOverPlayer = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop);

  // Paths to your sound assets
  final String _swipeSoundPath = 'audio/sfxs/swipe.mp3';
  final String _correctCategorySoundPath = 'audio/sfxs/correct.mp3';
  final String _newHighScoreSoundPath = 'audio/sfxs/highscore.mp3';
  final String _gameOverSoundPath = 'audio/sfxs/gameover.mp3';
  final List<VoidCallback> _swipeSoundQueue = [];
  final List<VoidCallback> _correctCategorySoundQueue = [];

  SfxService(this._ref) {
    _initializeListeners();
    shouldPlaySfx.value =
        _ref.read(settingsNotifierProvider).value?.areSfxsEffectsActivated ??
            true;
  }

  void _initializeListeners() {
    _swipePlayer.onPlayerComplete.listen((event) {
      if (_swipeSoundQueue.isNotEmpty) {
        final soundToPlay = _swipeSoundQueue.removeAt(0);
        soundToPlay();
      }
    });

    _correctCategoryPlayer.onPlayerComplete.listen((event) {
      if (_correctCategorySoundQueue.isNotEmpty) {
        final soundToPlay = _correctCategorySoundQueue.removeAt(0);
        soundToPlay();
      }
    });

    _ref.listen(settingsNotifierProvider, (previous, next) {
      if (next.value?.areSfxsEffectsActivated == false) {
        shouldPlaySfx.value = false;
      } else {
        shouldPlaySfx.value = true;
      }
    });
  }

  void playSwipeSound() {
    if (!shouldPlaySfx.value) return;
    if (_swipePlayer.state == PlayerState.playing) {
      _swipeSoundQueue.add(_playSwipeSound);
    } else {
      _playSwipeSound();
    }
  }

  Future<void> _playSwipeSound() async {
    unawaited(_swipePlayer.play(AssetSource(_swipeSoundPath)));
  }

  void playCorrectCategorySound() {
    if (!shouldPlaySfx.value) return;
    if (_correctCategoryPlayer.state == PlayerState.playing) {
      _correctCategorySoundQueue.add(_playCorrectCategorySound);
    } else {
      _playCorrectCategorySound();
    }
  }

  Future<void> _playCorrectCategorySound() async {
    await _correctCategoryPlayer.play(AssetSource(_correctCategorySoundPath));
  }

  Future<void> playNewHighScoreSound() async {
    if (!shouldPlaySfx.value) return;
    await _newHighScorePlayer.play(AssetSource(_newHighScoreSoundPath));
  }

  Future<void> playGameOverSound() async {
    if (!shouldPlaySfx.value) return;
    await _gameOverPlayer.play(AssetSource(_gameOverSoundPath));
  }

  void dispose() {
    // Dispose all AudioPlayer instances to free up resources
    _swipePlayer.dispose();
    _correctCategoryPlayer.dispose();
    _newHighScorePlayer.dispose();
    _gameOverPlayer.dispose();
  }
}

final sfxServiceProvider = Provider<SfxService>((ref) {
  return SfxService(ref);
});
