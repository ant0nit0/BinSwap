import 'package:flutter/material.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class LeaderboardItem extends StatelessWidget {
  final Score score;
  final int index;
  final bool highlight;
  const LeaderboardItem(
    this.score, {
    required this.index,
    this.highlight = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultTinyPadding),
      color: highlight ? yellowWinColor : neutralLight,
      child: Row(
        children: [
          Text(
            '$index.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: neutralDark,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: kDefaultSmallPadding),
          Text(
            '${score.value}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: neutralDark,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            '${formatTime(score.timeInSec.toInt())} s',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: neutralDark,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
