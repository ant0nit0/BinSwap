import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class SnowInfo extends StatelessWidget {
  final bool isDark;
  const SnowInfo({
    this.isDark = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: neutralLight,
              shape: BoxShape.circle,
              border: Border.all(
                color: blueMainColor,
                width: 2.0,
              )),
          height: 50.0,
          padding: const EdgeInsets.all(8.0),
          width: 50.0,
          child: Image.asset(
            'assets/images/icons/specials/snowflake.png',
          ),
        ),
        const SizedBox(width: kDefaultSmallPadding),
        Expanded(
          child: Text(
            translate('game.infos.how-to-play.snow-description'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark ? neutralDark : neutralLight,
                ),
          ),
        ),
      ],
    );
  }
}
