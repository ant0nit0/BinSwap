import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:recycling_master/utils/theme.dart';

class EndGameButtons extends HookConsumerWidget {
  const EndGameButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        KButton.green(
          text: translate('endGame.buttons.restart'),
          onPressed: () {
            ref.read(gameStateNotifierProvider.notifier).refresh();
            // Pop all the routes until the first one
            // to avoid having multiple game screens
            navigatorKey.currentState
                ?.popUntil((route) => route.isFirst && route.isCurrent);
            // Push the game screen
            navigatorKey.currentState?.pushNamed(
              Routes.gameScreen,
            );
          },
        ),
        const SizedBox(height: kDefaultPadding),
        KButton.blue(
          text: translate('endGame.buttons.home'),
          onPressed: () {
            ref.read(isUserPlayingProvider.notifier).state = false;
            ref.read(gameStateNotifierProvider.notifier).reset();
            // Pop all the routes until the first one
            // to avoid having multiple game screens
            navigatorKey.currentState
                ?.popUntil((route) => route.isFirst && route.isCurrent);
            // Push the home screen
            navigatorKey.currentState?.pushReplacementNamed(
              Routes.homeScreen,
            );
          },
        ),
      ],
    );
  }
}
