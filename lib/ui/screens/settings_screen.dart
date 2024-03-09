import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/background_audio_switch.dart';
import 'package:recycling_master/ui/widgets/credentials.dart';
import 'package:recycling_master/ui/widgets/lang_settings_selector.dart';
import 'package:recycling_master/ui/widgets/settings_bin_attributions_button.dart';
import 'package:recycling_master/ui/widgets/settings_reset_leaderboard_button.dart';
import 'package:recycling_master/ui/widgets/sfx_switch.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(langProvider);

    return BlurredScaffold(
      backgroundImagePath: 'assets/images/backgrounds/snow_bg.png',
      title: translate('settings.title'),
      automaticallyImplementClosing: true,
      onClose: () =>
          navigatorKey.currentState!.pushReplacementNamed(Routes.homeScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LangSettingsSelector(),
            const BackgroundAudioSwitch(),
            const SfxSwitchRow(),
            const SettingsBinColorAttributionsButton(),
            const SizedBox(
              height: kDefaultSmallPadding,
            ),
            const ResetLeaderboardTextButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const CredentialsWidget(),
          ],
        ).separated(
          separator: const SizedBox(
            height: kDefaultPadding,
          ),
        ),
      ),
    );
  }
}
