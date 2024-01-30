// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsPreferences {
  bool get isBackgroundAudioActivated => throw _privateConstructorUsedError;
  bool get areSfxsEffectsActivated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsPreferencesCopyWith<SettingsPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsPreferencesCopyWith<$Res> {
  factory $SettingsPreferencesCopyWith(
          SettingsPreferences value, $Res Function(SettingsPreferences) then) =
      _$SettingsPreferencesCopyWithImpl<$Res, SettingsPreferences>;
  @useResult
  $Res call({bool isBackgroundAudioActivated, bool areSfxsEffectsActivated});
}

/// @nodoc
class _$SettingsPreferencesCopyWithImpl<$Res, $Val extends SettingsPreferences>
    implements $SettingsPreferencesCopyWith<$Res> {
  _$SettingsPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBackgroundAudioActivated = null,
    Object? areSfxsEffectsActivated = null,
  }) {
    return _then(_value.copyWith(
      isBackgroundAudioActivated: null == isBackgroundAudioActivated
          ? _value.isBackgroundAudioActivated
          : isBackgroundAudioActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      areSfxsEffectsActivated: null == areSfxsEffectsActivated
          ? _value.areSfxsEffectsActivated
          : areSfxsEffectsActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsPreferencesImplCopyWith<$Res>
    implements $SettingsPreferencesCopyWith<$Res> {
  factory _$$SettingsPreferencesImplCopyWith(_$SettingsPreferencesImpl value,
          $Res Function(_$SettingsPreferencesImpl) then) =
      __$$SettingsPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isBackgroundAudioActivated, bool areSfxsEffectsActivated});
}

/// @nodoc
class __$$SettingsPreferencesImplCopyWithImpl<$Res>
    extends _$SettingsPreferencesCopyWithImpl<$Res, _$SettingsPreferencesImpl>
    implements _$$SettingsPreferencesImplCopyWith<$Res> {
  __$$SettingsPreferencesImplCopyWithImpl(_$SettingsPreferencesImpl _value,
      $Res Function(_$SettingsPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBackgroundAudioActivated = null,
    Object? areSfxsEffectsActivated = null,
  }) {
    return _then(_$SettingsPreferencesImpl(
      isBackgroundAudioActivated: null == isBackgroundAudioActivated
          ? _value.isBackgroundAudioActivated
          : isBackgroundAudioActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      areSfxsEffectsActivated: null == areSfxsEffectsActivated
          ? _value.areSfxsEffectsActivated
          : areSfxsEffectsActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsPreferencesImpl implements _SettingsPreferences {
  const _$SettingsPreferencesImpl(
      {required this.isBackgroundAudioActivated,
      required this.areSfxsEffectsActivated});

  @override
  final bool isBackgroundAudioActivated;
  @override
  final bool areSfxsEffectsActivated;

  @override
  String toString() {
    return 'SettingsPreferences(isBackgroundAudioActivated: $isBackgroundAudioActivated, areSfxsEffectsActivated: $areSfxsEffectsActivated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsPreferencesImpl &&
            (identical(other.isBackgroundAudioActivated,
                    isBackgroundAudioActivated) ||
                other.isBackgroundAudioActivated ==
                    isBackgroundAudioActivated) &&
            (identical(
                    other.areSfxsEffectsActivated, areSfxsEffectsActivated) ||
                other.areSfxsEffectsActivated == areSfxsEffectsActivated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isBackgroundAudioActivated, areSfxsEffectsActivated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsPreferencesImplCopyWith<_$SettingsPreferencesImpl> get copyWith =>
      __$$SettingsPreferencesImplCopyWithImpl<_$SettingsPreferencesImpl>(
          this, _$identity);
}

abstract class _SettingsPreferences implements SettingsPreferences {
  const factory _SettingsPreferences(
      {required final bool isBackgroundAudioActivated,
      required final bool areSfxsEffectsActivated}) = _$SettingsPreferencesImpl;

  @override
  bool get isBackgroundAudioActivated;
  @override
  bool get areSfxsEffectsActivated;
  @override
  @JsonKey(ignore: true)
  _$$SettingsPreferencesImplCopyWith<_$SettingsPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
