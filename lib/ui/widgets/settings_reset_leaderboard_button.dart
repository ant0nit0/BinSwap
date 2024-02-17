import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/utils/colors.dart';

class ResetLeaderboardTextButton extends HookConsumerWidget {
  const ResetLeaderboardTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    title: const Text('Reset leaderboard'),
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
