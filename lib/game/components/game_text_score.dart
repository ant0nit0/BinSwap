import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextScore extends TextComponent with HasGameRef<KGame> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    text = '${translate('game.score')}0';
    position = Vector2(kDefaultPadding, gameRef.size.y * 0.15);
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'LilitaOne',
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    text = '${translate('game.score')}${game.scoreNotifier.value}';
  }
}
