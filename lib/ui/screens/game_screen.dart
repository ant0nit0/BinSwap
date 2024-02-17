import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/overlays/tutorial_overlay.dart';
import 'package:recycling_master/game/widgets/pause_button.dart';
import 'package:recycling_master/game/widgets/game_top_icons.dart';
import 'package:recycling_master/game/overlays/settings_game_dialog.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/game_state_notifier.dart';
import 'package:recycling_master/game/overlays/end_game_screen.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/utils/theme.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  static const String endGameDialogKey = 'win_dialog';
  static const String topIconsKey = 'top_icons';
  static const String pausePlayKey = 'pause_play';
  static const String settingsDialogKey = 'settings_dialog';
  static const String tutorial1 = 'tuto1';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameStateNotifierProvider);

    final showTutorial = useState(false);
    // We get the highscore in order to know if the user as already played the game
    // If not, we show the onBoarding
    //
    // This also allow the leaderboard to load the previous scores when the game screen loads,
    // So that going to the endGameScreen will not be waiting while loading the scores
    final highScore = ref.watch(leaderboardProvider.notifier).highScore;
    if (highScore == null) {
      showTutorial.value = true;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GameWidget(
              game: KGame(
                state,
                ref,
                isTutorial: showTutorial.value,
              ),
              overlayBuilderMap: {
                endGameDialogKey: (BuildContext context, KGame game) {
                  return EndGameScreen(
                      Score(
                          value: game.scoreNotifier.value,
                          timeInSec: game.timeNotifier.value),
                      game: game);
                },
                topIconsKey: (BuildContext context, KGame game) {
                  return GameTopIcons(game);
                },
                pausePlayKey: (BuildContext context, KGame game) {
                  return Positioned(
                    top: MediaQuery.of(context).size.height * .15,
                    right: kDefaultPadding,
                    child: PauseButton(game),
                  );
                },
                settingsDialogKey: (BuildContext context, KGame game) {
                  return SettingsGameOverlay(game);
                },
                tutorial1: (BuildContext context, KGame game) {
                  return TutorialOverlay(game);
                },
              },
            ),
          )
        ],
      ),
    );
  }
}
