import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/components/pause_button.dart';
import 'package:recycling_master/game/game_top_icons.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/ui/screens/end_game_screen.dart';
import 'package:recycling_master/game/game_header.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/theme.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  static const String endGameDialogKey = 'win_dialog';
  static const String topIconsKey = 'top_icons';
  static const String pausePlayKey = 'pause_play';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final state = ref.watch(gameStateNotifierProvider);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(width: width, child: const GameHeader()),
          ),
          Positioned.fill(
            child: GameWidget(
              game: KGame(state),
              overlayBuilderMap: {
                endGameDialogKey: (BuildContext context, KGame game) {
                  return EndGameScreen(game.scoreNotifier.value, game: game);
                },
                topIconsKey: (BuildContext context, KGame game) {
                  return const GameTopIcons();
                },
                pausePlayKey: (BuildContext context, KGame game) {
                  return Positioned(
                    top: MediaQuery.of(context).size.height * .15,
                    right: kDefaultPadding,
                    child: PauseButton(game),
                  );
                },
              },
            ),
          )
        ],
      ),
    );
  }
}
