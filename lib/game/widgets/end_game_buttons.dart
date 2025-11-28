import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class EndGameButtons extends HookConsumerWidget {
  final bool inGame;
  const EndGameButtons({this.inGame = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onQuit() {
      ref.read(isUserPlayingProvider.notifier).setPlaying(false);
      ref.read(gameStateProvider.notifier).reset();
      // Pop all the routes until the first one
      // to avoid having multiple game screens
      navigatorKey.currentState?.popUntil(
        (route) => route.isFirst && route.isCurrent,
      );
      // Push the home screen
      navigatorKey.currentState?.pushReplacementNamed(Routes.homeScreen);
    }

    ref.watch(langProvider);

    return Column(
      children: [
        KButton.green(
          text: AppLocalizations.of(context)!.endGameButtonsRestart,
          onPressed: () async {
            // FIXME: Make a better restart
            ref.read(isUserPlayingProvider.notifier).setPlaying(true);
            await ref
                .read(gameStateProvider.notifier)
                .refresh(); // FIXME : The music does not restart
            // Pop all the routes until the first one
            // to avoid having multiple game screens
            navigatorKey.currentState?.popUntil(
              (route) => route.isFirst && route.isCurrent,
            );
            // Push the game screen
            navigatorKey.currentState?.pushReplacementNamed(Routes.gameScreen);
          },
        ),
        const SizedBox(height: kDefaultPadding),
        inGame
            ? KButton.red(
                text: AppLocalizations.of(context)!.endGameButtonsQuit,
                onPressed: onQuit,
              )
            : KButton.blue(
                text: AppLocalizations.of(context)!.endGameButtonsHome,
                onPressed: onQuit,
              ),
      ],
    );
  }
}
