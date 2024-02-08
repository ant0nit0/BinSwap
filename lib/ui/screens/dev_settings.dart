import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/theme.dart';

class DevSettingsScreen extends HookConsumerWidget {
  const DevSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dev Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultLargePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            KButton.blue(
              text: 'Reset caches',
              onPressed: () async =>
                  await ref.read(storageServiceProvider).clearAll(),
            ),
          ],
        ),
      ),
    );
  }
}
