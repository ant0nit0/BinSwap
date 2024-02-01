import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/overlays/game_modal_overlay.dart';
import 'package:recycling_master/game/overlays/how_to_play_overlay.dart';
import 'package:recycling_master/game/overlays/recycling_guide_overlay.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class InfosMainOverlay extends HookWidget {
  final KGame game;
  const InfosMainOverlay(
    this.game, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GameModalOverlay(
      title: translate('game.infos.title'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _button(
              context,
              translate(
                'game.infos.buttons.recycling',
              ),
              'recycling',
              bgColor: greenbgColor,
              mainColor: greenTextColor, onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const RecyclingGuideOverlay();
                });
          }),
          const SizedBox(height: kDefaultSmallPadding),
          _button(
              context,
              translate(
                'game.infos.buttons.how-to',
              ),
              'question',
              bgColor: orangebgColor,
              mainColor: orangeTextColor, onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const HowToPlayOverlay();
                });
          }),
        ],
      ),
    );
  }

  Widget _button(
    BuildContext context,
    String title,
    String svgPath, {
    required Color bgColor,
    required Color mainColor,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: neutralDark.withOpacity(0.25),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultSmallPadding,
        ),
        child: Row(
          children: [
            KSVG(
              svgPath,
              color: mainColor,
              height: 32.0,
              width: 32.0,
            ),
            const SizedBox(width: kDefaultPadding),
            Text(title,
                style: TextStyle(
                  color: mainColor,
                  fontFamily: 'LilitaOne',
                  fontSize: 20.0,
                )),
          ],
        ),
      ),
    );
  }
}
