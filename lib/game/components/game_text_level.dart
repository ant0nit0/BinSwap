import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextLevel extends TextComponent with HasGameRef<KGame> {
  final currentLevel = ValueNotifier(1);

  final isAnimating = ValueNotifier(false);

  final velocity = 200.0;

  final double initialY = kDefaultLargePadding;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    text = '${translate('game.level')}${game.levelNotifier.value.number}';
    position = Vector2(game.size.x / 2 - size.x / 2, initialY);
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
    if (currentLevel.value != game.levelNotifier.value.number) {
      currentLevel.value = game.levelNotifier.value.number;
      updateText();
    }
    if (isAnimating.value) {
      final distance = position.y - initialY;
      final movement = velocity * dt;

      final scaleDistance = scale.y - 1;
      final scaleMovement = 0.5 * dt;

      if (distance.abs() <= movement) {
        position.y = initialY;
        isAnimating.value = false; // Stop further movement
      } else {
        // Continue moving towards the target
        position.y -= movement * distance.sign; // Move in the correct direction
      }

      if (scaleDistance.abs() <= scaleMovement) {
        scale = Vector2(1, 1);
      } else {
        scale.y -= scaleMovement * scaleDistance.sign;
        scale.x -= scaleMovement * scaleDistance.sign;
      }
    }
    position.x = game.size.x / 2 - size.x * scale.x / 2;
  }

  void updateText() {
    text = '${translate('game.level')}${game.levelNotifier.value.number}';
    scale = Vector2(1.5, 1.5);
    position = Vector2(game.size.x / 2 - size.x * scale.x / 2,
        game.size.y / 2 - size.y * scale.y / 2);
    isAnimating.value = true;
  }
}
