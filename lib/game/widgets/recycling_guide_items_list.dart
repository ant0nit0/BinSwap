import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/bin_list_item.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class RecyclingGuideItemsList extends HookConsumerWidget {
  const RecyclingGuideItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameBinsState = ref.watch(gameStateProvider);

    return gameBinsState.when(
      data: (gameBins) {
        final bins = gameBins.bins;
        final List otherBins = [...allBins]
            .map(
              (e) => bins.map((f) => f.title).toList().contains(e.title)
                  ? null
                  : e,
            )
            .where((element) => element != null)
            .toList();

        const miniTitleTextStyle = TextStyle(
          fontFamily: 'LilitaOne',
          color: neutralDark,
          fontSize: 14.0,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultTinyPadding),
              child: Text(
                AppLocalizations.of(
                  context,
                )!.gameInfosRecyclingGuideCurrentTitle,
                style: miniTitleTextStyle,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bins.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: kDefaultTinyPadding),
              itemBuilder: (context, index) {
                return BinListItem(bins[index]);
              },
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultTinyPadding),
              child: Text(
                AppLocalizations.of(context)!.gameInfosRecyclingGuideOtherTitle,
                style: miniTitleTextStyle,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherBins.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: kDefaultTinyPadding),
              itemBuilder: (context, index) {
                return BinListItem(otherBins[index]);
              },
            ),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
