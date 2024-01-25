import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_settings_preferences.freezed.dart';

@freezed
class AudioSettingsPreferences with _$AudioSettingsPreferences {
  const factory AudioSettingsPreferences({
    @Default(true) bool isBackgroundAudioActivated,
    @Default(true) bool areSfxsEffectsActivated,
  }) = _AudioSettingsPreferences;
}
