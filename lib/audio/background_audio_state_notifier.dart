import 'package:recycling_master/audio/background_audio_service.dart';
import 'package:recycling_master/providers/audio_settings_preferences.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_audio_state_notifier.g.dart';

/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [AudioSettingsNotifier] to pause or play the audio.
///
/// It listens to the [isUserPlayingProvider] to play the game music or the non-game music.
@Riverpod(keepAlive: true)
class BackgroundAudioStateNotifier extends _$BackgroundAudioStateNotifier {
  @override
  FutureOr<BackgroundAudioMode> build() async {
    await _init();
    return state.requireValue;
  }

  Future<void> _init() async {
    state = const AsyncLoading();
    // Wait for the service to be initialized
    final audioService = await ref.read(backgroundAudioServiceProvider.future);
    _listenToPreferences(audioService);
    _updateAudioState(audioService);
  }

  /// Listen to the [AudioSettingsNotifier] and the [isUserPlayingProvider] to update the audio state.
  void _listenToPreferences(BackgroundAudioService audioService) {
    ref.listen(audioSettingsNotifierProvider, (_, next) {
      _updateAudioState(audioService);
    });

    ref.listen<bool>(isUserPlayingProvider, (_, __) {
      _updateAudioState(audioService);
    });
  }

  /// Update the audio state according to the [AudioSettingsNotifier] and the [isUserPlayingProvider].
  void _updateAudioState(BackgroundAudioService audioService) {
    final audioPreferences =
        ref.read(audioSettingsNotifierProvider).requireValue;
    if (!audioPreferences.isBackgroundAudioActivated) {
      audioService.pauseMusics();
      state = const AsyncData(BackgroundAudioMode.muted);
    } else {
      final isUserPlaying = ref.read(isUserPlayingProvider);
      if (isUserPlaying) {
        audioService.setGameMusic();
        state = const AsyncData(BackgroundAudioMode.gameplay);
      } else {
        audioService.setNonGameMusic();
        state = const AsyncData(BackgroundAudioMode.nonGameplay);
      }
    }
  }

  Future<void> refreshGameMusic() async {
    final audioService = await ref.read(backgroundAudioServiceProvider.future);
    audioService.refreshGameMusic();
  }

  Future<void> resetGameMusic() async {
    final audioService = await ref.read(backgroundAudioServiceProvider.future);
    audioService.resetGameMusic();
  }
}

enum BackgroundAudioMode {
  muted,
  gameplay,
  nonGameplay,
}
