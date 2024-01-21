import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameLeaderboard extends StatelessWidget {
  const GameLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultLargePadding),
      decoration: BoxDecoration(
        color: neutralLight,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 260.0,
      width: double.infinity,
    );
  }
}
