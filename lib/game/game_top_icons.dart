import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameTopIcons extends StatelessWidget {
  const GameTopIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding)
          .copyWith(bottom: kDefaultSmallPadding),
      child: const Row(
        children: [
          RoundedIconButton(
            icon: KSVG('gear'),
          ),
          SizedBox(
            width: kDefaultSmallPadding,
          ),
          RoundedIconButton(
            icon: KSVG('sound_on'), // FIXME: check if sound is on
          ),
          Spacer(),
          RoundedIconButton(
            icon: Text(
              'i',
              style: TextStyle(
                fontSize: 22.0,
                color: yellowMainColor,
                fontFamily: 'LilitaOne',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
