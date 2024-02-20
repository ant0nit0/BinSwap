import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:recycling_master/game/components/game_bin_icon.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/theme.dart';

class GameBin extends SpriteComponent
    with HasGameRef<KGame>, CollisionCallbacks {
  final Bin bin;
  final int columnIndex;
  double? newPosition;
  final double velocity = 400;

  GameBin({required this.bin, required this.columnIndex});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Load the sprite image
    sprite =
        Sprite(await Flame.images.load('icons/bins/${bin.color.name}.png'));
    // Set the size
    size = Vector2(55, 80);
    // And set the position
    final x = columnIndex *
            gameRef.size.x /
            gameRef.state.nbCol + // Left border of the column
        (gameRef.size.x / gameRef.state.nbCol / 2 - // Center of the column
            size.x / 2); // Move it to center, according to its size
    final y = gameRef.size.y -
        size.y -
        kDefaultLargePadding; // kDefaultLargePadding of bottom
    position = Vector2(x, y);

    await add(RectangleHitbox());
    final icon = GameBinIcon(iconName: bin.category.name);
    icon.position = Vector2(size.x / 2 - GameBinIcon.iconSize / 2,
        size.y / 2 - GameBinIcon.iconSize / 2);
    await add(icon);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // If there is a new position (swapping bins), move towards it
    if (newPosition != null) {
      final distance = newPosition! - position.x;
      final movement = (velocity + game.levelNotifier.value.number * 20) * dt;

      if (distance.abs() <= movement) {
        // If the bin is close enough to the target, set it directly to the target
        position.x = newPosition!;
        newPosition = null; // Stop further movement
      } else {
        // Continue moving towards the target
        position.x += movement * distance.sign; // Move in the correct direction
      }
    }
  }

  void setNewPosition(double x) {
    newPosition = x;
  }
}
