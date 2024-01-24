import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/colors.dart';

class LangSettingsSelector extends HookConsumerWidget {
  const LangSettingsSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(langProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          translate('settings.lang'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: neutralLight,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (currentLang == 'en') {
              ref.read(langProvider.notifier).changeLang('fr');
            } else {
              ref.read(langProvider.notifier).changeLang('en');
            }
          },
          child: KSVG(
            currentLang,
            noColor: true,
            width: 40,
            borderRadius: 4.0,
          ),
        ),
      ],
    );
  }
}
