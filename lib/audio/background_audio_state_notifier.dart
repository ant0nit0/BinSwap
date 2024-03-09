import 'package:recycling_master/audio/background_audio_service.dart';
import 'package:recycling_master/models/settings_preferences.dart';
import 'package:recycling_master/providers/settings_preferences.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_audio_state_notifier.g.dart';

/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [SettingsNotifier] to pause or play the audio.
///
/// It listens to the [isUserPlayingProvider] to play the game music or the non-game music.
@Riverpod(keepAlive: true)
class BackgroundAudioStateNotifier extends _$BackgroundAudioStateNotifier {
  late SettingsPreferences _audioSettingsPreferences;

  @override
  FutureOr<BackgroundAudioMode> build() async {
    await _init();
    return state.requireValue;
  }

  Future<void> _init() async {
    state = const AsyncLoading();

    // Wait for the service to be initialized
    final audioService = await ref.read(backgroundAudioServiceProvider.future);

    _audioSettingsPreferences =
        await ref.read(settingsNotifierProvider.future) ??
            const SettingsPreferences(
              isBackgroundAudioActivated: true,
              areSfxsEffectsActivated: true,
            );

    _listenToPreferences(audioService);
    await _updateAudioState(audioService);
  }

  /// Listen to the [SettingsNotifier] to update the audio state.
  void _listenToPreferences(BackgroundAudioService audioService) {
    ref.listen(settingsNotifierProvider, (_, next) {
      _audioSettingsPreferences = next.value ??
          const SettingsPreferences(
              isBackgroundAudioActivated: true, areSfxsEffectsActivated: true);
      _updateAudioState(audioService);
    });
  }

  /// Update the audio state according to the [SettingsNotifier] and the [isUserPlayingProvider].
  Future<void> _updateAudioState(BackgroundAudioService audioService) async {
    // final pref = audioPreferences ??
    //     await ref.watch(audioSettingsNotifierProvider.future);
    // final isUserPlaying = ref.read(isUserPlayingProvider);

    if (!_audioSettingsPreferences.isBackgroundAudioActivated) {
      audioService.pauseBackgroundMusic();
      state = const AsyncData(BackgroundAudioMode.muted);
    } else {
      audioService.resumeBackgroundMusic();
      state = const AsyncData(BackgroundAudioMode.playing);
    }
  }
}

enum BackgroundAudioMode {
  muted,
  playing,
}
