import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/components/game_score_added_indicator_text.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/kgame.dart';

class GameItem extends SpriteComponent
    with HasGameRef<KGame>, CollisionCallbacks {
  static const double padding = 2.0;
  late final int _columnIndex;
  final Item item;
  final Color color;
  final isAccelerate = ValueNotifier(false);

  GameItem({
    required this.item,
    required this.color,
  });

  @override
  void onCollision(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    super.onCollision(intersectionPoints, other);
    if (other is GameBin) {
      // Same category, add the score
      if (other.bin.category == item.category) {
        game.increaseScore(item.score);
        _createScoreIndicator(
            Vector2(
                other.position.x + other.size.x, other.position.y - size.y / 2),
            (item.score * game.scoreFactor.value).toString());
      } else {
        // Wrong category, decrease the score
        await game.decreaseScore();
      }
      removeFromParent();
    }
  }

  Future<void> _createScoreIndicator(
      Vector2 startPosition, String scoreText) async {
    final scoreIndicator = GameScoreAddedIndicator(
        startPosition: startPosition, scoreText: scoreText);
    // We add it directly into the game because this item component is going to be removed soon
    return await game.add(scoreIndicator);
  }

  void accelerate() {
    isAccelerate.value = true;
  }

  @override
  void onRemove() {
    super.onRemove();
    // Remove the item from the game
    gameRef.removeItemPerColumn(_columnIndex, this);
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final img =
        await Flame.images.load('icons/${item.category.name}/${item.name}.png');
    // Load the sprite
    sprite = Sprite(
      img,
      srcSize: Vector2(64, 64),
    );

    // Adjust the size  for padding
    size = Vector2(sprite!.image.width + padding * 2,
        sprite!.originalSize.y + padding * 2);

    // Randomly choose a column index
    final rand = Random().nextInt(gameRef.state.nbCol);
    _columnIndex = rand;
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

    // Store this as the last item of the column
    gameRef.addItemPerColumn(_columnIndex, this);

    await add(CircleHitbox(
      radius: (size.x / 2 + padding * 2),
      anchor: Anchor.center,
    ));
  }

  @override
  // ignore: must_call_super
  void render(Canvas canvas) {
    final circleRadius =
        (size.x / 2) + padding; // Circle radius including padding
    final circleOffset =
        Offset(size.x / 4.4, size.y / 4.4); // Center of the sprite

    // Draw the background circle
    final whitePaint = Paint()..color = Colors.white.withOpacity(.5);
    final paint = Paint()
      ..color = color.withOpacity(game.levelNotifier.value.itemOpacity);
    final strokePaint = Paint()
      ..color =
          color.withOpacity(max(1, game.levelNotifier.value.itemOpacity * 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(circleOffset, circleRadius, whitePaint);
    canvas.drawCircle(circleOffset, circleRadius, paint);
    canvas.drawCircle(circleOffset, circleRadius, strokePaint);

    // We use this instead of 'super.render()' to render the sprite
    // To be able to resize it properly
    sprite!.render(canvas, size: Vector2(32, 32));

    // super.render(canvas); // Render the sprite
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += gameRef.levelNotifier.value.itemSpeed *
        dt *
        (isAccelerate.value ? 3 : 1) *
        // We don't need to multiply by the item speed factor if the item is accelerating
        (isAccelerate.value ? 1 : game.itemSpeedFactor.value);
  }
}
