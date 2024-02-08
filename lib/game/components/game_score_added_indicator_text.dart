import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';

class GameScoreAddedIndicator extends TextComponent with HasGameRef<KGame> {
  final double duration;
  final Vector2 startPosition;
  final String scoreText;
  final _opacity = ValueNotifier(1.0);

  GameScoreAddedIndicator({
    this.duration = 1.5,
    required this.startPosition,
    required this.scoreText,
  }) {
    text = "+$scoreText";
    position = startPosition.clone();
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontFamily: 'LilitaOne',
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the position to move down
    position.add(Vector2(0, 20.0 * dt));

    // Update the opacity to fade out
    _opacity.value -= dt;

    // Remove the component once it's fully faded out
    if (_opacity.value <= 0) {
      removeFromParent();
    }
  }
}
