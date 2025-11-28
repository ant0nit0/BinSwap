import 'package:flutter/material.dart';
// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';

class PauseButton extends HookConsumerWidget {
  final KGame game;
  const PauseButton(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isUserPlayingProvider);
    return RoundedIconButton(
      icon: KSVG(isPlaying ? 'pause' : 'play'),
      onPressed: () {
        if (game.isTutorial) return;
        if (isPlaying) {
          game.pauseEngine();
        } else {
          game.resumeEngine();
        }
        // ignore: invalid_use_of_protected_member
        ref.read(isUserPlayingProvider.notifier).state = !isPlaying;
      },
    );
  }
}
