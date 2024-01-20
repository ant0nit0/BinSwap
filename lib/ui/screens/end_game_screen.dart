import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.75),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(kDefaultLargePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translate('endGame.title'),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: neutralLight,
                      fontSize: 36.0,
                      fontFamily: 'LilitaOne',
                    ),
              ),
              const SizedBox(height: kDefaultSmallPadding),
              const Divider(
                color: grayBorderColor,
                thickness: 1.0,
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  Text(
                    translate('endGame.score'),
                    style: textSyle,
                  ),
                  const SizedBox(width: kDefaultSmallPadding),
                  Text(
                    '$score',
                    style: textSyle,
                  ),
                ],
              ),
              const SizedBox(height: kDefaultTinyPadding),
              Row(
                children: [
                  Text(
                    translate('endGame.highScore'),
                    style: textSyle,
                  ),
                  const SizedBox(width: kDefaultSmallPadding),
                  const Text(
                    '0',
                    style: textSyle,
                  ),
                ],
              ),
              const SizedBox(height: kDefaultLargePadding),
              Container(
                decoration: BoxDecoration(
                  color: neutralLight,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 260.0,
                width: double.infinity,
              ),
              const SizedBox(height: kDefaultLargePadding),
              KButton.green(
                text: translate('endGame.buttons.restart'),
                onPressed: () {
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
          ),
        ),
      ),
    );
  }
}
