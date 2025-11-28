import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextScore extends TextComponent with HasGameReference<KGame> {
  late final TextComponent scoreComponent;

  /// BuildContext used for localization
  late BuildContext _context;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final context = navigatorKey.currentContext;
    if (context != null) {
      _context = context;
      text = AppLocalizations.of(_context)!.gameScore;
    }
    position = Vector2(kDefaultPadding, game.size.y * 0.15);
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'LilitaOne',
      ),
    );
    scoreComponent = TextComponent(
      text: '${game.scoreNotifier.value}',
      position: Vector2(size.x + kDefaultSmallPadding, 0),
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 34,
          color: yellowMainColor,
          fontFamily: 'LilitaOne',
        ),
      ),
    );

    await add(scoreComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreComponent.text = '${game.scoreNotifier.value}';
  }
}
