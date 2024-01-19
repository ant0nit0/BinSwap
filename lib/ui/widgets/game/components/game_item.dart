import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/ui/widgets/game/components/game_bin.dart';
import 'package:recycling_master/ui/widgets/game/kgame.dart';

class GameItem extends SpriteComponent
    with HasGameRef<KGame>, CollisionCallbacks {
  static const double padding = 4.0;
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
        print('Item falls in the correct bin : ${item.category.name}');
        gameRef.scoreNotifier.value += item.score;
      } else {
        // Wrong category, remove the score
        // gameRef.score -= item.score;
        game.lifeNotifier.value -= 1;
        if (game.lifeNotifier.value == 0) {
          game.pauseEngine();
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
    // Adjust the size to account for padding
    size = Vector2(sprite!.originalSize.x + padding * 2,
        sprite!.originalSize.y + padding * 2);

    final rand = Random().nextInt(gameRef.state.nbCol);

    final columnPosition = gameRef.size.x * (1 / gameRef.state.nbCol) * rand;
    final halfOfColumnWidth = (gameRef.size.x * (1 / gameRef.state.nbCol)) / 2;
    final halfOfItemSize = (size.x / 2 - padding) / 2;

    position = Vector2(
      columnPosition + halfOfColumnWidth - halfOfItemSize,
      gameRef.size.y * .25 + (padding + size.y / 2) / 2, // - size.y,
    );

    await add(CircleHitbox(radius: (size.x / 2)));
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
