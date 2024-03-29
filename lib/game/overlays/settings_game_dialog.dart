import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/game/widgets/end_game_buttons.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/widgets/background_audio_switch.dart';
import 'package:recycling_master/ui/widgets/credentials.dart';
import 'package:recycling_master/ui/widgets/lang_settings_selector.dart';
import 'package:recycling_master/ui/widgets/sfx_switch.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/theme.dart';

class SettingsGameOverlay extends HookConsumerWidget {
  final KGame game;
  const SettingsGameOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(langProvider);
    return BlurredScaffold(
      title: translate('game.settings.title'),
      automaticallyImplementClosing: true,
      onClose: () {
        game.overlays.remove(GameScreen.settingsDialogKey);
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LangSettingsSelector(),
            const BackgroundAudioSwitch(),
            const SfxSwitchRow(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            const EndGameButtons(inGame: true),
            const CredentialsWidget(),
          ],
        ).separated(
          separator: const SizedBox(height: kDefaultPadding),
        ),
      ),
    );
  }
}
