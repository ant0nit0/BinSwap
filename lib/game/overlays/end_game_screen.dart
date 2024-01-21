import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';
import 'package:recycling_master/game/widgets/end_game_buttons.dart';
import 'package:recycling_master/game/widgets/game_leaderboard.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class EndGameScreen extends StatelessWidget {
  final int score;
  final KGame game;
  const EndGameScreen(
    this.score, {
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textSyle = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: neutralLight,
    );
    return BlurredScaffold(
      title: translate('endGame.title'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _texts(translate('endGame.score'), '$score', textSyle),
          const SizedBox(height: kDefaultTinyPadding),
          _texts(translate('endGame.highScore'), 'TO DO', textSyle),
          const GameLeaderboard(),
          const EndGameButtons(),
        ],
      ),
    );
  }

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
