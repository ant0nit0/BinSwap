import 'package:flutter/material.dart';
import 'package:recycling_master/game/game_top_icons.dart';
import 'package:recycling_master/game/score_widget.dart';
import 'package:recycling_master/game/timer_widget.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';
import 'package:recycling_master/utils/theme.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GameTopIcons(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScoreWidget(),
                  TimerWidget(),
                ],
              ),
              Spacer(),
              RoundedIconButton(
                icon: KSVG('pause'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
