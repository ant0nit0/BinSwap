import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/game/widgets/end_game_buttons.dart';
import 'package:recycling_master/game/widgets/end_game_score_widget.dart';
import 'package:recycling_master/game/widgets/game_leaderboard.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/coins.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/utils/widgets_utils.dart';

class EndGameScreen extends HookConsumerWidget {
  final Score score;
  final KGame game;
  const EndGameScreen(
    this.score, {
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onFirstBuild(() async {
      await ref.read(leaderboardProvider.notifier).addScore(score);
      await ref.read(coinsProvider.notifier).addCoins(score.value);
    });

    final highScore = ref.watch(leaderboardProvider.notifier).highScore;
    final isNewHighScore = highScore == null || score.value > highScore.value;

    final confettiController =
        ConfettiController(duration: const Duration(seconds: 2));

    useEffect(() {
      if (isNewHighScore) {
        confettiController.play();
      }
      return confettiController.dispose;
    }, []);

    return BlurredScaffold(
      mainAxisAlignment: MainAxisAlignment.center,
      title: translate('endGame.title'),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EndGameScoreWidget(score),
                GameLeaderboard(score),
                const EndGameButtons(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: -pi / 2,
              maxBlastForce: 35, // set a lower max blast force
              minBlastForce: 10, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 75, // a lot of particles at once
              gravity: .1,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirection: -pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 75,
              maxBlastForce: 35,
              minBlastForce: 10,
              gravity: 0.1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: pi / 2,
              maxBlastForce: 8, // set a lower max blast force
              minBlastForce: 5, // set a lower min blast force
              emissionFrequency: 0.01,
              numberOfParticles: 25, // a lot of particles at once
              gravity: .2,
            ),
          ),
        ],
      ),
    );
  }
}
