import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class EndGameScoreWidget extends HookConsumerWidget {
  final Score score;
  const EndGameScoreWidget(this.score, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: neutralLight,
    );

    final highScore = ref.watch(leaderboardProvider.notifier).highScore;
    final isNewHighScore = highScore == null || score.value > highScore.value;

    return isNewHighScore
        ? _highScore(context)
        : _score(textStyle, highScore.value);
  }

  Widget _highScore(BuildContext context) => Column(
        children: [
          Text(
            'NEW HIGHSCORE',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: neutralLight,
                  fontSize: 24.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: kDefaultTinyPadding),
          Text(
            '${score.value}',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: yellowMainColor,
                  fontSize: 24.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      );

  Widget _score(TextStyle textStyle, int highScore) => Column(
        children: [
          _texts(translate('endGame.score'), '${score.value}', textStyle),
          const SizedBox(height: kDefaultTinyPadding),
          _texts(translate('endGame.highScore'), '$highScore', textStyle),
        ],
      );

  Widget _texts(String text1, String text2, TextStyle ts) {
    return Row(
      children: [
        Text(
          text1,
          style: ts,
        ),
        const SizedBox(width: kDefaultSmallPadding),
        Text(
          text2,
          style: ts,
        ),
      ],
    );
  }
}
