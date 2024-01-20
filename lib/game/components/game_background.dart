import 'package:flame/components.dart';
import 'package:recycling_master/game/kgame.dart';

class GameBackground extends SpriteComponent with HasGameRef<KGame> {
  GameBackground();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('backgrounds/spring_bg_1.png');
    size = Vector2(gameRef.size.x, gameRef.size.y);
  }
}
