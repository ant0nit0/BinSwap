// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  bool? get isBought => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get fullPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res, ShopItem>;
  @useResult
  $Res call(
      {bool? isBought,
      String name,
      int price,
      String imagePath,
      String fullPath});
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res, $Val extends ShopItem>
    implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBought = freezed,
    Object? name = null,
    Object? price = null,
    Object? imagePath = null,
    Object? fullPath = null,
  }) {
    return _then(_value.copyWith(
      isBought: freezed == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopItemImplCopyWith<$Res>
    implements $ShopItemCopyWith<$Res> {
  factory _$$ShopItemImplCopyWith(
          _$ShopItemImpl value, $Res Function(_$ShopItemImpl) then) =
      __$$ShopItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isBought,
      String name,
      int price,
      String imagePath,
      String fullPath});
}

/// @nodoc
class __$$ShopItemImplCopyWithImpl<$Res>
    extends _$ShopItemCopyWithImpl<$Res, _$ShopItemImpl>
    implements _$$ShopItemImplCopyWith<$Res> {
  __$$ShopItemImplCopyWithImpl(
      _$ShopItemImpl _value, $Res Function(_$ShopItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBought = freezed,
    Object? name = null,
    Object? price = null,
    Object? imagePath = null,
    Object? fullPath = null,
  }) {
    return _then(_$ShopItemImpl(
      isBought: freezed == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopItemImpl implements _ShopItem {
  const _$ShopItemImpl(
      {this.isBought,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.fullPath});

  factory _$ShopItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopItemImplFromJson(json);

  @override
  final bool? isBought;
  @override
  final String name;
  @override
  final int price;
  @override
  final String imagePath;
  @override
  final String fullPath;

  @override
  String toString() {
    return 'ShopItem(isBought: $isBought, name: $name, price: $price, imagePath: $imagePath, fullPath: $fullPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopItemImpl &&
            (identical(other.isBought, isBought) ||
                other.isBought == isBought) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.fullPath, fullPath) ||
                other.fullPath == fullPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isBought, name, price, imagePath, fullPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      __$$ShopItemImplCopyWithImpl<_$ShopItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopItemImplToJson(
      this,
    );
  }
}

abstract class _ShopItem implements ShopItem {
  const factory _ShopItem(
      {final bool? isBought,
      required final String name,
      required final int price,
      required final String imagePath,
      required final String fullPath}) = _$ShopItemImpl;

  factory _ShopItem.fromJson(Map<String, dynamic> json) =
      _$ShopItemImpl.fromJson;

  @override
  bool? get isBought;
  @override
  String get name;
  @override
  int get price;
  @override
  String get imagePath;
  @override
  String get fullPath;
  @override
  @JsonKey(ignore: true)
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
