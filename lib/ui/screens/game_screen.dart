import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/ui/screens/end_game_screen.dart';
import 'package:recycling_master/ui/widgets/game/game_header.dart';
import 'package:recycling_master/ui/widgets/game/kgame.dart';
import 'package:recycling_master/utils/constants.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const String endGameDialogKey = 'win_dialog';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const bins = sampleBins;
    final categories = bins.map((e) => e.category).toSet();
    final items = allItems
        .where((element) => categories.contains(element.category))
        .toList();
    final state = GameState(bins: bins, items: items);
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
              },
            ),
          )
        ],
      ),
    );
  }
}
