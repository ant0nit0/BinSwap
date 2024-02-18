import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextTime extends TextComponent with HasGameRef<KGame> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final color = game.state.backgroundPath == 'backgrounds/space.png' ||
            game.state.backgroundPath == 'backgrounds/forest.png'
        ? neutralLight
        : neutralDark;

    text = '${translate('game.time')} 0';
    position = Vector2(kDefaultPadding, game.size.y * 0.2);
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    text =
        '${translate('game.time')} ${game.timeNotifier.value < 10 ? '0' : ''}${game.timeNotifier.value}';
  }
}
