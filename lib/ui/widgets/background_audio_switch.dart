import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/settings_preferences.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/utils/colors.dart';

class BackgroundAudioSwitch extends HookConsumerWidget {
  const BackgroundAudioSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPreferences = ref.watch(settingsProvider);

    // Thiw widgets being in the settings page, we need to watch the langProvider
    // to be able to rebuild the widget when the language changes.
    ref.watch(langProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsAudio,
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
              audioPreferences.value?.isBackgroundAudioActivated ?? true,
          onActivate: () =>
              ref.read(settingsProvider.notifier).activateBackgroundAudio(),
          onDeactivate: () =>
              ref.read(settingsProvider.notifier).deactivateBackgroundAudio(),
        ),
      ],
    );
  }
}
