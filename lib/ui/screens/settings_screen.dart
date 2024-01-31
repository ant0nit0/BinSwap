import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/background_audio_switch.dart';
import 'package:recycling_master/ui/widgets/credentials.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/ui/widgets/lang_settings_selector.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/theme.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: neutralLight,
    );

    ref.watch(langProvider);

    return BlurredScaffold(
      backgroundImagePath: 'assets/images/backgrounds/snow_bg.png',
      title: translate('settings.title'),
      automaticallyImplementClosing: true,
      onClose: () => navigatorKey.currentState!.pop(),
      child: Column(
        children: [
          const LangSettingsSelector(),
          const BackgroundAudioSwitch(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translate('settings.sfx'),
                style: textStyle,
              ),
              KSwitch(
                width: 60.0,
                initialValue: true,
                onActivate: () {},
              )
            ],
          ),
          const Spacer(),
          const CredentialsWidget(),
        ],
      ).separated(
        separator: const SizedBox(
          height: kDefaultPadding,
        ),
      ),
    );
  }
}
