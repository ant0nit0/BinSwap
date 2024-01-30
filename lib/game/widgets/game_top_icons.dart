import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/infos_main_button.dart';
import 'package:recycling_master/game/widgets/settings_button.dart';
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
          SettingsGameButton(game),
          const SizedBox(
            width: kDefaultSmallPadding,
          ),
          const Spacer(),
          InfosMainButton(game),
        ],
      ),
    );
  }
}
