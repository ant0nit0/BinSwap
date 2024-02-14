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
  double _width = 0.0;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    size = Vector2((gameRef.size.x - 2 * kDefaultPadding), 8);
    position = Vector2(kDefaultPadding, gameRef.size.y * 0.23);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _width = size.x * (max(0, gameRef.lifeNotifier.value) / defaultLife);
    if (_width < size.x) {
      gameRef.lifeNotifier.value += refillSpeed * dt;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final bgPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 25, 25)
      ..style = PaintingStyle.fill;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 25, 255, 25)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        height,
      ),
      bgPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        _width,
        height,
      ),
      paint,
    );
  }
}
