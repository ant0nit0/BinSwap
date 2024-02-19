import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/bins_number.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class DevSettingsScreen extends HookConsumerWidget {
  const DevSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.watch(binsNumberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dev Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
        child: Column(
          children: [
            KButton.blue(
              text: 'Reset caches',
              onPressed: () async =>
                  await ref.read(storageServiceProvider).clearAll(),
            ),
            const SizedBox(height: kDefaultLargePadding),
            KButton.green(
              text: 'Add coins',
              onPressed: () async =>
                  await ref.read(coinsProvider.notifier).addCoins(3500),
            ),
            const SizedBox(height: kDefaultLargePadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Expert mode : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'LilitaOne',
                    color: neutralDark,
                  ),
                ),
                KSwitch(
                  initialValue: initialValue == 4,
                  onActivate: () =>
                      ref.read(binsNumberProvider.notifier).setExpertMode(),
                  onDeactivate: () =>
                      ref.read(binsNumberProvider.notifier).setNormalMode(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
