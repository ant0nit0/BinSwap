import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recycling_master/models/shop_item.dart';

part 'shop_state.freezed.dart';
part 'shop_state.g.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({
    required List<ShopItem> backgrounds,
    required List<String> characters,
  }) = _ShopState;

  factory ShopState.fromJson(Map<String, dynamic> json) =>
      _$ShopStateFromJson(json);
}
