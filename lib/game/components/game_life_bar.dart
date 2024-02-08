import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class GameLifeBar extends PositionComponent with HasGameRef<KGame> {
  static const refillSpeed = 0.05;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    position = Vector2(kDefaultPadding, gameRef.size.y * 0.23);
    size = Vector2(gameRef.size.x - 2 * kDefaultPadding, 8);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.lifeNotifier.value < defaultLife) {
      gameRef.lifeNotifier.value += refillSpeed * dt;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final bgPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 0, 0)
      ..style = PaintingStyle.fill;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 255, 0)
      ..style = PaintingStyle.fill;

    final width = size.x;

    final lifeWidth =
        // The max is used to avoid overflows in the bar when the party is over
        // (Seen in background, but still visible)
        width * (max(0, gameRef.lifeNotifier.value) / defaultLife);

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        width,
        height,
      ),
      bgPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        lifeWidth,
        height,
      ),
      paint,
    );
  }
}
