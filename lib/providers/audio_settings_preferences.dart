import 'package:recycling_master/models/audio_settings_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_settings_preferences.g.dart';

@Riverpod(keepAlive: true)
class AudioSettingsNotifier extends _$AudioSettingsNotifier {
  @override
  FutureOr<AudioSettingsPreferences> build() {
    state = const AsyncLoading();
    // TODO: Get it from the local storage
    state = const AsyncData(AudioSettingsPreferences());
    return state.requireValue;
  }

  void deactivateBackgroundAudio() {
    state = AsyncData(
        state.requireValue.copyWith(isBackgroundAudioActivated: false));
  }

  void activateBackgroundAudio() {
    state = AsyncData(
        state.requireValue.copyWith(isBackgroundAudioActivated: true));
  }

  void deactivateSfxsEffects() {
    state =
        AsyncData(state.requireValue.copyWith(areSfxsEffectsActivated: false));
  }

  void activateSfxsEffects() {
    state =
        AsyncData(state.requireValue.copyWith(areSfxsEffectsActivated: true));
  }
}
