import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTextTime extends TextComponent with HasGameReference<KGame> {
  /// BuildContext used for localization
  late BuildContext _context;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final color =
        game.state.backgroundPath == 'backgrounds/space.png' ||
            game.state.backgroundPath == 'backgrounds/forest.png'
        ? neutralLight
        : neutralDark;

    final context = navigatorKey.currentContext;
    if (context != null) {
      _context = context;
      text = '${AppLocalizations.of(_context)!.gameTime} 0';
    }
    position = Vector2(kDefaultPadding, game.size.y * 0.2);
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    text =
        '${AppLocalizations.of(_context)!.gameTime} ${game.timeNotifier.value < 10 ? '0' : ''}${game.timeNotifier.value}';
  }
}
