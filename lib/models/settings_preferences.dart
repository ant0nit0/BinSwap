import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_abstract_class_inherits_abstract_member

part 'settings_preferences.freezed.dart';

@freezed
abstract class SettingsPreferences with _$SettingsPreferences {
  const factory SettingsPreferences({
    required bool isBackgroundAudioActivated,
    required bool areSfxsEffectsActivated,
    String? language,
  }) = _SettingsPreferences;
}
