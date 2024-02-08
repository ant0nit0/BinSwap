import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:recycling_master/game/kgame.dart';

class GameBinIcon extends SpriteComponent with HasGameRef<KGame> {
  static const iconSize = 24.0;
  final String iconName;

  GameBinIcon({required this.iconName});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Load the sprite image
    sprite = Sprite(await Flame.images.load('icons/bins/$iconName.png'));

    // Set the size
    size = Vector2(iconSize, iconSize);
  }
}
