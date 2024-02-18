// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopItemImpl _$$ShopItemImplFromJson(Map<String, dynamic> json) =>
    _$ShopItemImpl(
      isBought: json['isBought'] as bool?,
      name: json['name'] as String,
      price: json['price'] as int,
      imagePath: json['imagePath'] as String,
      fullPath: json['fullPath'] as String,
    );

Map<String, dynamic> _$$ShopItemImplToJson(_$ShopItemImpl instance) =>
    <String, dynamic>{
      'isBought': instance.isBought,
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'fullPath': instance.fullPath,
    };
