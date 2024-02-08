import 'dart:math';

import 'package:flame/components.dart';
import 'package:recycling_master/game/kgame.dart';

class GameBackground extends SpriteComponent with HasGameRef<KGame> {
  static const backgrounds = [
    'backgrounds/desert_bg_1.png',
    'backgrounds/snow_bg.png',
    'backgrounds/spring_bg_1.png',
  ];

  final Random _random;

  GameBackground() : _random = Random();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef
        .loadSprite(backgrounds[_random.nextInt(backgrounds.length)]);
    size = Vector2(gameRef.size.x, gameRef.size.y);
  }
}
