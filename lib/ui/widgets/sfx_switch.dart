import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/providers/settings_preferences.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/utils/colors.dart';

class SfxSwitchRow extends HookConsumerWidget {
  const SfxSwitchRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPreferences = ref.watch(settingsNotifierProvider);
    ref.watch(langProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          translate('settings.sfx'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: neutralLight,
          ),
        ),
        KSwitch(
          width: 60.0,
          initialValue:
              audioPreferences.valueOrNull?.areSfxsEffectsActivated ?? true,
          onActivate: () =>
              ref.read(settingsNotifierProvider.notifier).activateSfxsEffects(),
          onDeactivate: () => ref
              .read(settingsNotifierProvider.notifier)
              .deactivateSfxsEffects(),
        )
      ],
    );
  }
}
