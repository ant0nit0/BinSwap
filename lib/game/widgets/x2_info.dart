import 'package:flutter/material.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class X2Info extends StatelessWidget {
  final bool isDark;
  const X2Info({this.isDark = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: neutralLight,
            shape: BoxShape.circle,
            border: Border.all(color: blueMainColor, width: 2.0),
          ),
          height: 50.0,
          padding: const EdgeInsets.all(8.0),
          width: 50.0,
          child: Image.asset('assets/images/icons/specials/x2.png'),
        ),
        const SizedBox(width: kDefaultSmallPadding),
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.gameInfosHow2playX2Description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark ? neutralDark : neutralLight,
            ),
          ),
        ),
      ],
    );
  }
}
