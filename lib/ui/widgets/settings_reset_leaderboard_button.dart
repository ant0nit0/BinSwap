import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class ResetLeaderboardTextButton extends HookConsumerWidget {
  const ResetLeaderboardTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(langProvider);
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          // Open confirmation popup
          final bool reset = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: kDefaultSmallPadding,
                        horizontal: kDefaultPadding),
                    title: const Text('Reset leaderboard'),
                    titleTextStyle: const TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 20.0,
                      color: neutralDark,
                    ),
                    backgroundColor: neutralLight,
                    // actions
                    content: const Text(
                        'Are you sure you want to reset the leaderboard? This action cannot be undone.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  );
                },
              ) ??
              false;

          if (reset) {
            // Reset leaderboard
            ref.read(leaderboardProvider.notifier).clear();
          }
        },
        child: const Text(
          'Reset leaderboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: neutralLight,
          ),
        ),
      ),
    );
  }
}
