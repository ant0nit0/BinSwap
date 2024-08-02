import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';

class GameX2 extends SpriteComponent
    with HasGameRef<KGame>, TapCallbacks, CollisionCallbacks {
  static const double padding = 2.0;
  static const color = neutralLight;

  final shouldScale = ValueNotifier(false);
  final scaleFactor = ValueNotifier(1.0);

  GameX2();

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    // Load the sprite
    sprite = Sprite(
      await Flame.images.load('icons/specials/x2.png'),
      srcSize: Vector2(64, 64),
    );

    // Adjust the size  for padding
    size = Vector2(sprite!.originalSize.x + padding * 2,
        sprite!.originalSize.y + padding * 2);

    // Randomly choose a column index
    final rand = Random().nextInt(gameRef.state.nbCol);
    // The position of the top left corner of the random column
    final columnPosition = gameRef.size.x * (1 / gameRef.state.nbCol) * rand;

    // To center items, we need to first add the half a to the left position
    // and then subtract half of the item size.
    // In this way, the center of the item will be at the center of the column
    final halfOfColumnWidth = (gameRef.size.x * (1 / gameRef.state.nbCol)) / 2;
    final halfOfItemSize = (size.x / 2 - padding) / 2;
    // Niw we can set the position of the item
    position = Vector2(
      columnPosition + halfOfColumnWidth - halfOfItemSize,
      gameRef.size.y * .25 + (padding + size.y / 2) / 2,
    );

    await add(CircleHitbox(
      radius: (size.x / 2 + padding * 4),
      anchor: Anchor.center,
    ));
  }

  @override
  void onCollision(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    super.onCollision(intersectionPoints, other);
    if (other is GameBin) {
      removeFromParent();
    }
  }

  @override
  // ignore: must_call_super
  void render(Canvas canvas) {
    final circleRadius = ((size.x / 2) + padding) *
        scaleFactor.value; // Circle radius including padding
    final circleOffset =
        Offset(size.x / 4.4, size.y / 4.4); // Center of the sprite

    // Draw the background circle
    final paint = Paint()
      ..color = color.withOpacity(shouldScale.value ? .75 : 1);
    final strokePaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(circleOffset, circleRadius, paint);
    canvas.drawCircle(circleOffset, circleRadius, strokePaint);

    sprite!.render(canvas, size: Vector2(32, 32));
    // super.render(canvas); // Render the sprite
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += gameRef.levelNotifier.value.itemSpeed * .5 * dt;
    if (shouldScale.value) {
      scaleFactor.value += 50 * dt;
      if (scaleFactor.value >= 20) {
        shouldScale.value = false;
        game.x2();
        removeFromParent();
      }
    }
  }

  @override
  void onTapDown(TapDownEvent event) async {
    shouldScale.value = true;
    return;
  }
}
