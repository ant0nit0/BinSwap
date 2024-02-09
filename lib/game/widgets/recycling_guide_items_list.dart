import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/bin_list_item.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class RecyclingGuideItemsList extends HookConsumerWidget {
  const RecyclingGuideItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameBins = ref.watch(gameStateNotifierProvider).bins;
    final List otherBins = [...allBins]
        .map((e) =>
            gameBins.map((f) => f.title).toList().contains(e.title) ? null : e)
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
            translate('game.infos.recycling-guide.current-title'),
            style: miniTitleTextStyle,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gameBins.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: kDefaultTinyPadding),
          itemBuilder: (context, index) {
            return BinListItem(gameBins[index]);
          },
        ),
        const SizedBox(height: kDefaultSmallPadding),
        Padding(
          padding: const EdgeInsets.only(bottom: kDefaultTinyPadding),
          child: Text(
            translate('game.infos.recycling-guide.other-title'),
            style: miniTitleTextStyle,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: otherBins.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: kDefaultTinyPadding),
          itemBuilder: (context, index) {
            return BinListItem(otherBins[index]);
          },
        ),
      ],
    );
  }
}
