import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
                    title: Text(translate('settings.reset-leaderboard.title')),
                    titleTextStyle: const TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 20.0,
                      color: neutralDark,
                    ),
                    backgroundColor: neutralLight,
                    // actions
                    content: Text(
                        translate('settings.reset-leaderboard.description')),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(translate('settings.reset-leaderboard.no')),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child:
                            Text(translate('settings.reset-leaderboard.yes')),
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
        child: Text(
          translate('settings.reset-leaderboard.title'),
          style: const TextStyle(
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
