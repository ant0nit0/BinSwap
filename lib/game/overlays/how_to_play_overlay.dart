import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/overlays/game_modal_overlay.dart';
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
      title: translate('game.infos.how-to-play.title'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate('game.infos.how-to-play.goal-title'),
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              translate('game.infos.how-to-play.goal-description'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Text(
              translate('game.infos.how-to-play.how-to-title'),
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              translate('game.infos.how-to-play.how-to-description'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Text(
              translate('game.infos.how-to-play.bonus-title'),
              style: titleTextStyle,
            ),
            const SizedBox(height: kDefaultTinyPadding),
            Text(
              translate('game.infos.how-to-play.bonus-description'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: kDefaultSmallPadding),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: neutralLight,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: blueMainColor,
                        width: 2.0,
                      )),
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  width: 50.0,
                  child: Image.asset(
                    'assets/images/icons/specials/snowflake.png',
                  ),
                ),
                const SizedBox(width: kDefaultSmallPadding),
                Expanded(
                  child: Text(
                    translate('game.infos.how-to-play.snow-description'),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
