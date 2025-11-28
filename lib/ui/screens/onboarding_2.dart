import 'package:flutter/material.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/utils/colors.dart';

class OnBoardingSecondPage extends StatelessWidget {
  const OnBoardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/icons/other/logo_big.png',
          height: 80.0,
          width: 80.0,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: AppLocalizations.of(context)!.onBoarding21),
              TextSpan(
                text: AppLocalizations.of(context)!.onBoarding22,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: AppLocalizations.of(context)!.onBoarding23),
            ],
          ),
        ),
        Image.asset('assets/images/icons/other/all_items.png'),
        Text(
          AppLocalizations.of(context)!.onBoarding24,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: neutralDark,
            fontSize: 20.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
