import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_abstract_class_inherits_abstract_member

part 'shop_item.freezed.dart';
part 'shop_item.g.dart';

@freezed
abstract class ShopItem with _$ShopItem {
  const factory ShopItem({
    bool? isBought,
    required String name,
    required int price,
    required String imagePath,
    required String fullPath,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);

  factory ShopItem.defaultBGSpring() => const ShopItem(
    isBought: true,
    name: 'Spring',
    price: 0,
    imagePath: 'backgrounds/spring.png',
    fullPath: 'assets/images/backgrounds/spring.png',
  );
}
