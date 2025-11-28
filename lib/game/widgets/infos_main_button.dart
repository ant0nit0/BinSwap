import 'package:flutter/material.dart';
// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/game/overlays/infos_main_overlay.dart';
import 'package:recycling_master/providers/is_user_playing.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';
import 'package:recycling_master/utils/colors.dart';

class InfosMainButton extends HookConsumerWidget {
  final KGame game;
  const InfosMainButton(this.game, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RoundedIconButton(
      icon: const Text(
        'i',
        style: TextStyle(
          fontSize: 22.0,
          color: yellowMainColor,
          fontFamily: 'LilitaOne',
        ),
      ),
      onPressed: () async {
        game.pauseEngine();
        // ignore: invalid_use_of_protected_member
        ref.read(isUserPlayingProvider.notifier).state = false;
        await showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return InfosMainOverlay(game);
          },
        );
      },
    );
  }
}
