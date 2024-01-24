import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/widgets/lang_settings_selector.dart';

class SettingsGameOverlay extends HookConsumerWidget {
  final KGame game;
  const SettingsGameOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(langProvider);
    return BlurredScaffold(
      title: translate('game.settings.title'),
      mainAxisAlignment: MainAxisAlignment.center,
      automaticallyImplementClosing: true,
      onClose: () {
        game.overlays.remove(GameScreen.settingsDialogKey);
        game.resumeEngine();
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LangSettingsSelector(),
        ],
      ),
    );
  }
}
