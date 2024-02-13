import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextScore extends TextComponent with HasGameRef<KGame> {
  late final TextComponent scoreComponent;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    text = translate('game.score');
    position = Vector2(kDefaultPadding, gameRef.size.y * 0.15);
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'LilitaOne',
      ),
    );
    scoreComponent = TextComponent(
        text: '${game.scoreNotifier.value}',
        position: Vector2(size.x + kDefaultSmallPadding, 0),
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 34,
            color: yellowMainColor,
            fontFamily: 'LilitaOne',
          ),
        ));

    await add(scoreComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreComponent.text = '${game.scoreNotifier.value}';
  }
}
