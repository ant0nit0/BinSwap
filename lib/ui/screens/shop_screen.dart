import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/models/shop_item.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/providers/shop.dart';
import 'package:recycling_master/ui/widgets/shop_item_widget.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class ShopScreen extends HookConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bgs = [...backgrounds];
    final state = ref.watch(shopProvider);
    final coinsState = ref.watch(coinsProvider);
    return BlurredScaffold(
      backgroundImagePath: 'assets/images/backgrounds/snow_bg.png',
      contentTopPadding: kDefaultSmallPadding,
      title: 'Shop',
      automaticallyImplementClosing: true,
      onClose: () =>
          navigatorKey.currentState!.pushReplacementNamed(Routes.homeScreen),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'You have : ',
                style: TextStyle(
                  color: neutralLight,
                  fontSize: 18.0,
                ),
              ),
              coinsState.when(
                data: (data) => Row(
                  children: [
                    const SizedBox(
                      width: kDefaultTinyPadding,
                    ),
                    Text(
                      '$data ',
                      style: const TextStyle(
                          color: neutralLight,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: kDefaultTinyPadding,
                    ),
                    Image.asset(
                      'assets/images/icons/other/coin.png',
                      height: 20.0,
                      width: 20.0,
                    ),
                  ],
                ),
                error: (_, __) => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultSmallPadding),
          const Text(
            'Backgrounds',
            style: TextStyle(
              color: neutralLight,
              fontSize: 20.0,
              fontFamily: 'LilitaOne',
            ),
          ),
          const SizedBox(height: kDefaultTinyPadding, width: double.infinity),
          state.when(
            data: (data) {
              return Wrap(
                runSpacing: kDefaultSmallPadding,
                spacing: kDefaultSmallPadding,
                children: bgs.map(
                  (bg) {
                    print('Data: $data');
                    final dataBgsName = data.backgrounds
                        .map((e) => e.name.toLowerCase())
                        .toList();
                    print('dataBgsName: $dataBgsName');
                    final item = ShopItem(
                      name: bg.name,
                      price: bg.price,
                      imagePath: bg.imagePath,
                      isBought: dataBgsName.contains(bg.name.toLowerCase()),
                      fullPath: bg.fullPath,
                    );
                    return GestureDetector(
                        onTap: () {
                          // TODO: open pop up
                        },
                        child: ShopItemWidget(item: item));
                  },
                ).toList(),
              );
            },
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      )),
    );
  }
}
