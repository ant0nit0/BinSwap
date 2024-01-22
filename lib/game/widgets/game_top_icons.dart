import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/overlays/infos_main_overlay.dart';
import 'package:recycling_master/game/widgets/sound_toggle.dart';
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
              game.overlays.add(GameScreen.settingsDialogKey);
            },
          ),
          const SizedBox(
            width: kDefaultSmallPadding,
          ),
          const SoundToggleButton(),
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
            onPressed: () async {
              game.pauseEngine();
              await showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return InfosMainOverlay(game);
                },
              );
              game.resumeEngine();
            },
          ),
        ],
      ),
    );
  }
}
