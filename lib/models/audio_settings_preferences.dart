import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_settings_preferences.freezed.dart';

@freezed
class AudioSettingsPreferences with _$AudioSettingsPreferences {
  const factory AudioSettingsPreferences({
    required bool isBackgroundAudioActivated,
    required bool areSfxsEffectsActivated,
  }) = _AudioSettingsPreferences;
}
