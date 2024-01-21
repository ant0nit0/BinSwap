import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';

class PauseButton extends HookWidget {
  final KGame game;
  const PauseButton(
    this.game, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(true);
    return RoundedIconButton(
      icon: KSVG(isPlaying.value ? 'pause' : 'play'),
      onPressed: () {
        if (isPlaying.value) {
          game.pauseEngine();
        } else {
          game.resumeEngine();
        }
        isPlaying.value = !isPlaying.value;
      },
    );
  }
}
