import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextLevel extends TextComponent with HasGameRef<KGame> {
  /// The current level of the game.
  ///
  /// Used to know when to launch the animation according to the game's level.
  final currentLevel = ValueNotifier(1);

  /// Value used to know if the text is animating or not.
  final isAnimating = ValueNotifier(false);

  /// The velocity of the text when it's animating
  final velocity = 200.0;

  /// The initial position of the text
  static const initialY = kDefaultLargePadding * .75;

  /// Value used to delay the animation.
  ///
  /// Basically it corresponds to the time the text stays in the center of the screen.
  final _animationDelayer = ValueNotifier(1.0);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    text = '${translate('game.level')}${game.levelNotifier.value.number}';
    position = Vector2(game.size.x / 2 - size.x / 2, initialY);
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        color: neutralDark,
        fontFamily: 'LilitaOne',
      ),
    );
    updateText();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (currentLevel.value != game.levelNotifier.value.number) {
      currentLevel.value = game.levelNotifier.value.number;
      updateText();
    }
    if (isAnimating.value) {
      if (_animationDelayer.value != 0) {
        // Wait a little bit with the text in the center before starting the animation
        _animationDelayer.value = max(0, _animationDelayer.value - dt);
      } else {
        // Position
        final distance = position.y - initialY;
        final movement = velocity * dt;
        // Scale
        final scaleDistance = scale.y - 1;
        final scaleMovement = 0.5 * dt;

        // If the distance is less than the movement, we stop the animation
        if (distance.abs() <= movement) {
          position.y = initialY;
          isAnimating.value = false; // Stop the animation
          _animationDelayer.value = 1; // Reset the delayer
        } else {
          position.y -= movement * distance.sign; // Move to the top
        }

        if (scaleDistance.abs() <= scaleMovement) {
          scale = Vector2(1, 1);
        } else {
          scale.y -= scaleMovement * scaleDistance.sign;
          scale.x -= scaleMovement * scaleDistance.sign;
        }
        // We have to reposition the text x because the scale is changing
        position.x = game.size.x / 2 - size.x * scale.x / 2;
      }
    }
  }

  void updateText() {
    text = '${translate('game.level')}${game.levelNotifier.value.number}';
    scale = Vector2(1.5, 1.5);
    position = Vector2(game.size.x / 2 - size.x * scale.x / 2,
        game.size.y / 2 - size.y * scale.y / 2);
    isAnimating.value = true;
  }
}
