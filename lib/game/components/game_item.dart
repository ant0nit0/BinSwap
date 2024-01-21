import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/kgame.dart';

class GameItem extends SpriteComponent
    with HasGameRef<KGame>, CollisionCallbacks {
  static const double padding = 2.0;
  final Item item;
  final Color color;

  GameItem({
    required this.item,
    required this.color,
  });

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is GameBin) {
      // Same category, add the score
      if (other.bin.category == item.category) {
        gameRef.scoreNotifier.value += item.score;
      } else {
        // Wrong category, remove the score
        gameRef.scoreNotifier.value = max(0, gameRef.scoreNotifier.value - 1);
        game.lifeNotifier.value -= 1;
        if (game.lifeNotifier.value == 0) {
          game.pauseEngine();
          game.overlays.add(GameScreen.endGameDialogKey);
        }
      }
      gameRef.remove(this);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    // Load the sprite
    sprite = Sprite(
      await Flame.images.load('icons/${item.category.name}/${item.name}.png'),
      srcSize: Vector2(136, 136),
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
      radius: (size.x / 2 + padding * 2),
      anchor: Anchor.center,
    ));
  }

  @override
  void render(Canvas canvas) {
    final circleRadius =
        (size.x / 2) + padding; // Circle radius including padding
    final circleOffset =
        Offset(size.x / 4.4, size.y / 4.4); // Center of the sprite

    // Draw the background circle
    final whitePaint = Paint()..color = Colors.white.withOpacity(.75);
    final paint = Paint()..color = color.withOpacity(.5);
    canvas.drawCircle(circleOffset, circleRadius, whitePaint);
    canvas.drawCircle(circleOffset, circleRadius, paint);

    super.render(canvas); // Render the sprite
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += gameRef.state.itemSpeed * dt;
  }
}
