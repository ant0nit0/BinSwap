import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/ui/widgets/lang_settings_selector.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/extensions.dart';
import 'package:recycling_master/utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: neutralLight,
    );

    return BlurredScaffold(
      title: translate('settings.title'),
      child: Column(
        children: [
          const LangSettingsSelector(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translate('settings.audio'),
                style: textStyle,
              ),
              KSwitch(
                width: 60.0,
                initialValue: true,
                onActivate: () {},
              )
            ],
          ),
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
        ],
      ).separated(
          separator: const SizedBox(
        height: kDefaultPadding,
      )),
    );
  }
}
