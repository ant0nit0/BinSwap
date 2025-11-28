import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/ui/widgets/color_distribution_item.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class ColorDistributionScreen extends HookConsumerWidget {
  const ColorDistributionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(binColorsProvider);
    return state.when(
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.settingsColorsTitle,
              style: const TextStyle(
                fontSize: 24.0,
                fontFamily: 'LilitaOne',
                color: neutralDark,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultSmallPadding,
            ).copyWith(bottom: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.settingsColorsSubtitle),
                const SizedBox(height: kDefaultPadding),
                for (final cat in data.keys.toList())
                  ColorDistributionItem(cat, gkey: GlobalKey()),
                const Spacer(),
                KButton.blue(
                  text: AppLocalizations.of(
                    context,
                  )!.settingsResetLeaderboardYes,
                  onPressed: () {
                    ref.read(binColorsProvider.notifier).reset();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
