import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:recycling_master/ui/widgets/game/kgame.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class GameLifeBar extends PositionComponent with HasGameRef<KGame> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    position = Vector2(kDefaultPadding, gameRef.size.y * 0.2);
    size = Vector2(gameRef.size.x - 2 * kDefaultPadding, 8);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final bgPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 0, 0)
      ..style = PaintingStyle.fill;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 255, 0)
      ..style = PaintingStyle.fill;

    final width = size.x;

    final lifeWidth = width * (gameRef.lifeNotifier.value / defaultLife);

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        width,
        height,
      ),
      bgPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        lifeWidth,
        height,
      ),
      paint,
    );
  }
}
