//import 'dart:math';

import 'package:flame/components.dart';
import 'package:recycling_master/game/kgame.dart';

class GameBackground extends SpriteComponent with HasGameRef<KGame> {
  // static const backgrounds = [
  //   'backgrounds/desert_bg_1.png',
  //   'backgrounds/snow_bg.png',
  //   'backgrounds/spring.png',
  // ];

  final String bgPath;

  // final Random _random;

  GameBackground(this.bgPath); // : _random = Random();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // sprite = await gameRef
    //     .loadSprite(backgrounds[_random.nextInt(backgrounds.length)]);
    sprite = await gameRef.loadSprite(bgPath);
    size = Vector2(gameRef.size.x, gameRef.size.y);
  }
}
