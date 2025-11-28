import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/providers/settings_preferences.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/utils/colors.dart';

class SfxSwitchRow extends HookConsumerWidget {
  const SfxSwitchRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPreferences = ref.watch(settingsProvider);
    ref.watch(langProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsSfx,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: neutralLight,
          ),
        ),
        KSwitch(
          width: 60.0,
          initialValue: audioPreferences.value?.areSfxsEffectsActivated ?? true,
          onActivate: () =>
              ref.read(settingsProvider.notifier).activateSfxsEffects(),
          onDeactivate: () =>
              ref.read(settingsProvider.notifier).deactivateSfxsEffects(),
        ),
      ],
    );
  }
}
