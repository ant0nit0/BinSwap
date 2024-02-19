import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';

class SettingsBinColorAttributionsButton extends HookConsumerWidget {
  const SettingsBinColorAttributionsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(langProvider);
    return GestureDetector(
      onTap: () =>
          navigatorKey.currentState!.pushNamed(Routes.colorAttributions),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate('settings.color-attributions'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: neutralLight,
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: neutralLight, size: 34.0)
        ],
      ),
    );
  }
}
