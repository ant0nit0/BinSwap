// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsPreferences {

 bool get isBackgroundAudioActivated; bool get areSfxsEffectsActivated; String? get language;
/// Create a copy of SettingsPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsPreferencesCopyWith<SettingsPreferences> get copyWith => _$SettingsPreferencesCopyWithImpl<SettingsPreferences>(this as SettingsPreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsPreferences&&(identical(other.isBackgroundAudioActivated, isBackgroundAudioActivated) || other.isBackgroundAudioActivated == isBackgroundAudioActivated)&&(identical(other.areSfxsEffectsActivated, areSfxsEffectsActivated) || other.areSfxsEffectsActivated == areSfxsEffectsActivated)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,isBackgroundAudioActivated,areSfxsEffectsActivated,language);

@override
String toString() {
  return 'SettingsPreferences(isBackgroundAudioActivated: $isBackgroundAudioActivated, areSfxsEffectsActivated: $areSfxsEffectsActivated, language: $language)';
}


}

/// @nodoc
abstract mixin class $SettingsPreferencesCopyWith<$Res>  {
  factory $SettingsPreferencesCopyWith(SettingsPreferences value, $Res Function(SettingsPreferences) _then) = _$SettingsPreferencesCopyWithImpl;
@useResult
$Res call({
 bool isBackgroundAudioActivated, bool areSfxsEffectsActivated, String? language
});




}
/// @nodoc
class _$SettingsPreferencesCopyWithImpl<$Res>
    implements $SettingsPreferencesCopyWith<$Res> {
  _$SettingsPreferencesCopyWithImpl(this._self, this._then);

  final SettingsPreferences _self;
  final $Res Function(SettingsPreferences) _then;

/// Create a copy of SettingsPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isBackgroundAudioActivated = null,Object? areSfxsEffectsActivated = null,Object? language = freezed,}) {
  return _then(_self.copyWith(
isBackgroundAudioActivated: null == isBackgroundAudioActivated ? _self.isBackgroundAudioActivated : isBackgroundAudioActivated // ignore: cast_nullable_to_non_nullable
as bool,areSfxsEffectsActivated: null == areSfxsEffectsActivated ? _self.areSfxsEffectsActivated : areSfxsEffectsActivated // ignore: cast_nullable_to_non_nullable
as bool,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsPreferences].
extension SettingsPreferencesPatterns on SettingsPreferences {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsPreferences() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsPreferences value)  $default,){
final _that = this;
switch (_that) {
case _SettingsPreferences():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsPreferences() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isBackgroundAudioActivated,  bool areSfxsEffectsActivated,  String? language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsPreferences() when $default != null:
return $default(_that.isBackgroundAudioActivated,_that.areSfxsEffectsActivated,_that.language);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isBackgroundAudioActivated,  bool areSfxsEffectsActivated,  String? language)  $default,) {final _that = this;
switch (_that) {
case _SettingsPreferences():
return $default(_that.isBackgroundAudioActivated,_that.areSfxsEffectsActivated,_that.language);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isBackgroundAudioActivated,  bool areSfxsEffectsActivated,  String? language)?  $default,) {final _that = this;
switch (_that) {
case _SettingsPreferences() when $default != null:
return $default(_that.isBackgroundAudioActivated,_that.areSfxsEffectsActivated,_that.language);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsPreferences implements SettingsPreferences {
  const _SettingsPreferences({required this.isBackgroundAudioActivated, required this.areSfxsEffectsActivated, this.language});
  

@override final  bool isBackgroundAudioActivated;
@override final  bool areSfxsEffectsActivated;
@override final  String? language;

/// Create a copy of SettingsPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsPreferencesCopyWith<_SettingsPreferences> get copyWith => __$SettingsPreferencesCopyWithImpl<_SettingsPreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsPreferences&&(identical(other.isBackgroundAudioActivated, isBackgroundAudioActivated) || other.isBackgroundAudioActivated == isBackgroundAudioActivated)&&(identical(other.areSfxsEffectsActivated, areSfxsEffectsActivated) || other.areSfxsEffectsActivated == areSfxsEffectsActivated)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,isBackgroundAudioActivated,areSfxsEffectsActivated,language);

@override
String toString() {
  return 'SettingsPreferences(isBackgroundAudioActivated: $isBackgroundAudioActivated, areSfxsEffectsActivated: $areSfxsEffectsActivated, language: $language)';
}


}

/// @nodoc
abstract mixin class _$SettingsPreferencesCopyWith<$Res> implements $SettingsPreferencesCopyWith<$Res> {
  factory _$SettingsPreferencesCopyWith(_SettingsPreferences value, $Res Function(_SettingsPreferences) _then) = __$SettingsPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool isBackgroundAudioActivated, bool areSfxsEffectsActivated, String? language
});




}
/// @nodoc
class __$SettingsPreferencesCopyWithImpl<$Res>
    implements _$SettingsPreferencesCopyWith<$Res> {
  __$SettingsPreferencesCopyWithImpl(this._self, this._then);

  final _SettingsPreferences _self;
  final $Res Function(_SettingsPreferences) _then;

/// Create a copy of SettingsPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isBackgroundAudioActivated = null,Object? areSfxsEffectsActivated = null,Object? language = freezed,}) {
  return _then(_SettingsPreferences(
isBackgroundAudioActivated: null == isBackgroundAudioActivated ? _self.isBackgroundAudioActivated : isBackgroundAudioActivated // ignore: cast_nullable_to_non_nullable
as bool,areSfxsEffectsActivated: null == areSfxsEffectsActivated ? _self.areSfxsEffectsActivated : areSfxsEffectsActivated // ignore: cast_nullable_to_non_nullable
as bool,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
