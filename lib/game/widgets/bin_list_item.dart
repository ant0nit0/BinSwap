import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/bin_image.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class BinListItem extends HookConsumerWidget {
  final Bin bin;
  const BinListItem(
    this.bin, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final binColor =
        ref.read(binColorsProvider.notifier).getColor(bin.category);

    final color = getColorFromBinColor(binColor);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultSmallPadding, vertical: kDefaultTinyPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BinImage(color: bin.color, category: bin.category),
                const SizedBox(width: kDefaultSmallPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bin.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: neutralDark,
                            fontSize: 14.0,
                            fontFamily: 'LilitaOne'),
                      ),
                      Text(
                        bin.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: neutralDark, fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: kDefaultTinyPadding),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final item in bin.items)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        margin:
                            const EdgeInsets.only(right: kDefaultTinyPadding),
                        padding: const EdgeInsets.all(kDefaultTinyPadding),
                        child: Image.asset(
                          'assets/images/icons/${bin.category.name}/${item.name}.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
