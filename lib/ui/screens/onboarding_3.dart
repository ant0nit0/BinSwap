import 'package:flutter/material.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/ui/widgets/kbutton.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';

class OnBoardingThirsPage extends StatelessWidget {
  const OnBoardingThirsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/icons/other/logo_big.png',
          height: 120.0,
          width: 120.0,
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
              TextSpan(
                text: AppLocalizations.of(context)!.onBoarding31,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: AppLocalizations.of(context)!.onBoarding32),
            ],
          ),
        ),
        Text(
          AppLocalizations.of(context)!.onBoarding33,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: neutralDark,
            fontSize: 20.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        KButton.black(
          text: AppLocalizations.of(context)!.onBoardingButton,
          onPressed: () => navigatorKey.currentState!.pushReplacementNamed(
            Routes.homeScreen,
          ),
        ),
      ],
    );
  }
}
