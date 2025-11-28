// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopState _$ShopStateFromJson(Map<String, dynamic> json) => _ShopState(
  backgrounds: (json['backgrounds'] as List<dynamic>)
      .map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  characters: (json['characters'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ShopStateToJson(_ShopState instance) =>
    <String, dynamic>{
      'backgrounds': instance.backgrounds,
      'characters': instance.characters,
    };
