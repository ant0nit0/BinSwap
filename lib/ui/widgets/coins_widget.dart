import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class CoinsWidget extends HookConsumerWidget {
  const CoinsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(coinsProvider);
    return Container(
      decoration: BoxDecoration(
        color: neutralDark.withOpacity(0.65),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kDefaultLargePadding),
          bottomLeft: Radius.circular(kDefaultLargePadding),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultTinyPadding,
        vertical: kDefaultSmallPadding * .75,
      ),
      child: Row(
        children: [
          const SizedBox(width: kDefaultTinyPadding),
          Image.asset(
            'assets/images/icons/other/coin.png',
            width: 24.0,
            height: 24.0,
          ),
          const SizedBox(width: kDefaultSmallPadding * .75),
          Text(
            '${coins.hasValue ? coins.value : '0'} ',
            style: const TextStyle(
              color: neutralLight,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
