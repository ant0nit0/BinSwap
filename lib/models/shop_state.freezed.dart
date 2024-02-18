// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopState _$ShopStateFromJson(Map<String, dynamic> json) {
  return _ShopState.fromJson(json);
}

/// @nodoc
mixin _$ShopState {
  List<ShopItem> get backgrounds => throw _privateConstructorUsedError;
  List<String> get characters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopStateCopyWith<ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res, ShopState>;
  @useResult
  $Res call({List<ShopItem> backgrounds, List<String> characters});
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res, $Val extends ShopState>
    implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgrounds = null,
    Object? characters = null,
  }) {
    return _then(_value.copyWith(
      backgrounds: null == backgrounds
          ? _value.backgrounds
          : backgrounds // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopStateImplCopyWith<$Res>
    implements $ShopStateCopyWith<$Res> {
  factory _$$ShopStateImplCopyWith(
          _$ShopStateImpl value, $Res Function(_$ShopStateImpl) then) =
      __$$ShopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShopItem> backgrounds, List<String> characters});
}

/// @nodoc
class __$$ShopStateImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$ShopStateImpl>
    implements _$$ShopStateImplCopyWith<$Res> {
  __$$ShopStateImplCopyWithImpl(
      _$ShopStateImpl _value, $Res Function(_$ShopStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgrounds = null,
    Object? characters = null,
  }) {
    return _then(_$ShopStateImpl(
      backgrounds: null == backgrounds
          ? _value._backgrounds
          : backgrounds // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopStateImpl implements _ShopState {
  const _$ShopStateImpl(
      {required final List<ShopItem> backgrounds,
      required final List<String> characters})
      : _backgrounds = backgrounds,
        _characters = characters;

  factory _$ShopStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopStateImplFromJson(json);

  final List<ShopItem> _backgrounds;
  @override
  List<ShopItem> get backgrounds {
    if (_backgrounds is EqualUnmodifiableListView) return _backgrounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backgrounds);
  }

  final List<String> _characters;
  @override
  List<String> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  String toString() {
    return 'ShopState(backgrounds: $backgrounds, characters: $characters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopStateImpl &&
            const DeepCollectionEquality()
                .equals(other._backgrounds, _backgrounds) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_backgrounds),
      const DeepCollectionEquality().hash(_characters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      __$$ShopStateImplCopyWithImpl<_$ShopStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopStateImplToJson(
      this,
    );
  }
}

abstract class _ShopState implements ShopState {
  const factory _ShopState(
      {required final List<ShopItem> backgrounds,
      required final List<String> characters}) = _$ShopStateImpl;

  factory _ShopState.fromJson(Map<String, dynamic> json) =
      _$ShopStateImpl.fromJson;

  @override
  List<ShopItem> get backgrounds;
  @override
  List<String> get characters;
  @override
  @JsonKey(ignore: true)
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
