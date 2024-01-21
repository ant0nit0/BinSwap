import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTopIcons extends StatelessWidget {
  final KGame game;
  const GameTopIcons(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding)
          .copyWith(top: kDefaultLargePadding),
      child: Row(
        children: [
          RoundedIconButton(
            icon: const KSVG('gear'),
            onPressed: () {
              game.pauseEngine();
              game.overlays.add(GameScreen.endGameDialogKey);
            },
          ),
          const SizedBox(
            width: kDefaultSmallPadding,
          ),
          RoundedIconButton(
            // FIXME: when sound is implemented
            icon: const KSVG('sound_on'),
            onPressed: () {},
          ),
          const Spacer(),
          RoundedIconButton(
            icon: const Text(
              'i',
              style: TextStyle(
                fontSize: 22.0,
                color: yellowMainColor,
                fontFamily: 'LilitaOne',
              ),
            ),
            onPressed: () {
              game.pauseEngine();
              game.overlays.add(GameScreen.topIconsKey);
            },
          ),
        ],
      ),
    );
  }
}
