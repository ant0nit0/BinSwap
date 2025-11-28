import 'package:flutter/material.dart';
import 'package:recycling_master/game/overlays/game_modal_overlay.dart';
import 'package:recycling_master/game/widgets/snow_info.dart';
import 'package:recycling_master/game/widgets/x2_info.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class HowToPlayOverlay extends StatelessWidget {
  const HowToPlayOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontFamily: 'LilitaOne',
      color: neutralDark,
      fontSize: 16.0,
    );

    return GameModalOverlay(
      title: AppLocalizations.of(context)!.gameInfosHow2playTitle,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playGoalTitle,
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playGoalDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playHow2title,
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playHow2description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playBonusTitle,
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              AppLocalizations.of(context)!.gameInfosHow2playBonusDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            const SnowInfo(),
            const SizedBox(height: kDefaultSmallPadding),
            const X2Info(),
          ],
        ),
      ),
    );
  }
}
