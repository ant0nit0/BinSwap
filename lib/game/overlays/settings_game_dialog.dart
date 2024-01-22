import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';

class SettingsGameOverlay extends StatelessWidget {
  final KGame game;
  const SettingsGameOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlurredScaffold(
      title: translate('game.settings.title'),
      automaticallyImplementClosing: true,
      onClose: () {
        game.overlays.remove(GameScreen.settingsDialogKey);
        game.resumeEngine();
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
