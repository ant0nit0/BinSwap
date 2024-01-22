import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/overlays/game_modal_overlay.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class RecyclingGuideOverlay extends StatelessWidget {
  const RecyclingGuideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    const miniTitleTextStyle = TextStyle(
      fontFamily: 'LilitaOne',
      color: neutralDark,
      fontSize: 14.0,
    );
    return GameModalOverlay(
      title: translate('game.infos.recycling-guide.title'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate('game.infos.recycling-guide.note'),
            style: const TextStyle(
              color: grayTextColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: kDefaultSmallPadding, bottom: kDefaultTinyPadding),
            child: Text(
              translate('game.infos.recycling-guide.current-title'),
              style: miniTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
