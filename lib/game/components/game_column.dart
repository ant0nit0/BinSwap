import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';

class GameColumn extends PositionComponent with HasGameReference<KGame> {
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
        (game.size.x + game.state.nbCol) / game.state.nbCol;
    final columnHeight = game.size.y * 0.75;

    size = Vector2(columnWidth, columnHeight);
    position = Vector2(
      columnWidth * columnIndex,
      (game.size.y - columnHeight) + 1.5, // + 1.5 to hide the bottom border
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _borderPaint);
  }
}
