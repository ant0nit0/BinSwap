import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';
import 'package:recycling_master/utils/colors.dart';

class SettingsGameButton extends HookConsumerWidget {
  final KGame game;
  const SettingsGameButton(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = game.state.backgroundPath == 'backgrounds/space.png' ||
            game.state.backgroundPath == 'backgrounds/forest.png'
        ? grayTextLightColor
        : neutralDark;
    return RoundedIconButton(
      icon: KSVG(
        'gear',
        color: color,
      ),
      onPressed: () {
        game.pauseEngine();
        ref.read(isUserPlayingProvider.notifier).state = false;
        game.overlays.add(GameScreen.settingsDialogKey);
      },
    );
  }
}
