import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/game/widgets/end_game_buttons.dart';
import 'package:recycling_master/game/widgets/end_game_score_widget.dart';
import 'package:recycling_master/game/widgets/game_leaderboard.dart';
import 'package:recycling_master/models/score.dart';
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
    });

    return BlurredScaffold(
      mainAxisAlignment: MainAxisAlignment.center,
      title: translate('endGame.title'),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EndGameScoreWidget(score),
            GameLeaderboard(score),
            const EndGameButtons(),
          ],
        ),
      ),
    );
  }
}
