import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/bin_image.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class BinListItem extends HookConsumerWidget {
  final Bin bin;
  const BinListItem(this.bin, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final binColor = ref
        .read(binColorsProvider.notifier)
        .getBinColor(bin.category);
    final color = getColorFromBinColor(binColor);
    final binTitle = switch (bin.category) {
      BinCategory.plastics => AppLocalizations.of(
        context,
      )!.gameInfosBinsPlasticsTitle,
      BinCategory.organics => AppLocalizations.of(
        context,
      )!.gameInfosBinsOrganicsTitle,
      BinCategory.electronics => AppLocalizations.of(
        context,
      )!.gameInfosBinsElectronicsTitle,
      BinCategory.papers => AppLocalizations.of(
        context,
      )!.gameInfosBinsPapersTitle,
      BinCategory.glass => AppLocalizations.of(
        context,
      )!.gameInfosBinsGlassTitle,
      BinCategory.textiles => throw UnimplementedError(),
    };

    final binDescription = switch (bin.category) {
      BinCategory.plastics => AppLocalizations.of(
        context,
      )!.gameInfosBinsPlasticsDescription,
      BinCategory.organics => AppLocalizations.of(
        context,
      )!.gameInfosBinsOrganicsDescription,
      BinCategory.electronics => AppLocalizations.of(
        context,
      )!.gameInfosBinsElectronicsDescription,
      BinCategory.papers => AppLocalizations.of(
        context,
      )!.gameInfosBinsPapersDescription,
      BinCategory.glass => AppLocalizations.of(
        context,
      )!.gameInfosBinsGlassDescription,
      BinCategory.textiles => throw UnimplementedError(),
    };

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .8),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultSmallPadding,
          vertical: kDefaultTinyPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BinImage(color: binColor, category: bin.category),
                const SizedBox(width: kDefaultSmallPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        binTitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: neutralDark,
                          fontSize: 14.0,
                          fontFamily: 'LilitaOne',
                        ),
                      ),
                      Text(
                        binDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: neutralDark,
                          fontSize: 10.0,
                        ),
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
                        margin: const EdgeInsets.only(
                          right: kDefaultTinyPadding,
                        ),
                        padding: const EdgeInsets.all(kDefaultTinyPadding),
                        child: Image.asset(
                          'assets/images/icons/${bin.category.name}/${item.name}.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
