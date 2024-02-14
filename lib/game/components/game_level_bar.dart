import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameLevelBar extends PositionComponent with HasGameRef<KGame> {
  static const refillSpeed = 5;
  double currentProgress = 0; // Current progress for smooth transition
  double targetProgress = 0; // Target progress based on game state

  bool isLevelAnimationPlaying = false;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    size = Vector2((gameRef.size.x - 2 * kDefaultPadding) / 2, 8);
    position =
        Vector2(gameRef.size.x / 2 - size.x / 2, kDefaultLargePadding * 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    targetProgress = gameRef.itemCountForLevel.value /
        gameRef.levelNotifier.value.nbItemsToSort;
    if (targetProgress > currentProgress || isLevelAnimationPlaying) {
      // Smoothly interpolate current progress towards the target progress
      currentProgress = min(
          currentProgress +
              (targetProgress - currentProgress) * refillSpeed * dt,
          isLevelAnimationPlaying ? size.x : targetProgress);
    } else if (targetProgress <= currentProgress) {
      isLevelAnimationPlaying = true;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final bgPaint = Paint()
      ..color = neutralDark
      ..style = PaintingStyle.fill;

    final progressPaint = Paint()
      ..color = neutralLight
      ..style = PaintingStyle.fill;

    // Calculate the width of the progress bar based on the currentProgress
    final progressWidth = size.x * currentProgress;

    // Background
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
      bgPaint,
    );

    // Progress bar
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        progressWidth,
        size.y,
      ),
      progressPaint,
    );
  }
}
