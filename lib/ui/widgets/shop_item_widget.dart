import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/models/shop_item.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/providers/selected_background.dart';
import 'package:recycling_master/providers/shop.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class ShopItemWidget extends HookConsumerWidget {
  static const size = 140.0;

  final ShopItem item;

  const ShopItemWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinsState = ref.watch(coinsProvider);
    final selectedBgState = ref.watch(selectedBackgroundProvider);
    return GestureDetector(
      onTap: () async {
        if (item.isBought != null && item.isBought!) {
          ref.read(selectedBackgroundProvider.notifier).selectBackground(item);
        } else {
          // Open the popup to buy the item
          final wantToBuy = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: Text(
                  'Buy ${item.name} ?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: neutralDark,
                      fontSize: 22.0,
                      fontFamily: 'LilitaOne'),
                ),
                content: coinsState.when(
                  data: (coins) {
                    final canBuy = coins >= item.price;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          canBuy
                              ? 'Do you want to buy ${item.name} for ${item.price} coins?'
                              : 'You don\'t have enough coins to buy ${item.name}.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: neutralDark,
                                    fontSize: 14.0,
                                  ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Row(
                          mainAxisAlignment: canBuy
                              ? MainAxisAlignment.spaceEvenly
                              : MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(canBuy ? 'No' : 'Cancel'),
                            ),
                            if (canBuy)
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('Yes'),
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                  error: (_, __) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                ),
              );
            },
          );
          if (wantToBuy ?? false) {
            ref.read(shopProvider.notifier).addBackground(item);
            ref.read(coinsProvider.notifier).removeCoins(item.price);
            ref
                .read(selectedBackgroundProvider.notifier)
                .selectBackground(item);
          }
        }
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.none,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item.fullPath,
                  fit: BoxFit.cover,
                  height: size,
                  width: size,
                ),
              ),
            ),
            if (!(item.isBought ?? false))
              Container(
                decoration: BoxDecoration(
                  color: neutralDark.withOpacity(.75),
                ),
                height: size,
                width: size,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const KSVG(
                        'lock',
                        color: neutralLight,
                        height: 40.0,
                        width: 40.0,
                      ),
                      const SizedBox(height: kDefaultTinyPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icons/other/coin.png',
                            height: 16.0,
                            width: 16.0,
                          ),
                          const SizedBox(width: kDefaultTinyPadding),
                          Text(
                            '${item.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: neutralLight,
                                  fontSize: 14.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            selectedBgState.when(
                data: (value) {
                  final isSelected =
                      value.name.toLowerCase() == item.name.toLowerCase();
                  return isSelected
                      ? Positioned(
                          top: -8.0,
                          right: -8.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: neutralLight,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: const Icon(
                              Icons.check,
                              color: neutralDark,
                              size: 16.0,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
                error: (_, __) => const SizedBox.shrink(),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}