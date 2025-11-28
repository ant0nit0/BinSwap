// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopItem _$ShopItemFromJson(Map<String, dynamic> json) => _ShopItem(
  isBought: json['isBought'] as bool?,
  name: json['name'] as String,
  price: (json['price'] as num).toInt(),
  imagePath: json['imagePath'] as String,
  fullPath: json['fullPath'] as String,
);

Map<String, dynamic> _$ShopItemToJson(_ShopItem instance) => <String, dynamic>{
  'isBought': instance.isBought,
  'name': instance.name,
  'price': instance.price,
  'imagePath': instance.imagePath,
  'fullPath': instance.fullPath,
};
