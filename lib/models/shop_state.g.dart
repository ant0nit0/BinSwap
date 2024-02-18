// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopStateImpl _$$ShopStateImplFromJson(Map<String, dynamic> json) =>
    _$ShopStateImpl(
      backgrounds: (json['backgrounds'] as List<dynamic>)
          .map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ShopStateImplToJson(_$ShopStateImpl instance) =>
    <String, dynamic>{
      'backgrounds': instance.backgrounds,
      'characters': instance.characters,
    };
