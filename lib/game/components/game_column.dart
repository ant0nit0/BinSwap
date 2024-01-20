import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';

class GameColumn extends PositionComponent with HasGameRef<KGame> {
  final int columnIndex;
  final Paint _borderPaint;

  GameColumn({required this.columnIndex})
      : _borderPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = grayBorderColor
          ..strokeWidth = 1.5;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final columnWidth =
        // We add the nbCol as pixels to hide the left and right borders
        (gameRef.size.x + gameRef.state.nbCol) / gameRef.state.nbCol;
    final columnHeight = gameRef.size.y * 0.75;

    size = Vector2(columnWidth, columnHeight);
    position = Vector2(
      columnWidth * columnIndex,
      (gameRef.size.y - columnHeight) + 1.5, // + 1.5 to hide the bottom border
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _borderPaint);
  }
}
