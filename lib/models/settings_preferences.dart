import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_preferences.freezed.dart';

@freezed
class SettingsPreferences with _$SettingsPreferences {
  const factory SettingsPreferences({
    required bool isBackgroundAudioActivated,
    required bool areSfxsEffectsActivated,
    String? language,
  }) = _SettingsPreferences;
}
