import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
                text: translate('onBoarding.3.1'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: translate('onBoarding.3.2'),
              ),
            ],
          ),
        ),
        Text(
          translate('onBoarding.3.3'),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: neutralDark,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
        ),
        KButton.black(
          text: translate('onBoarding.3.button'),
          onPressed: () => navigatorKey.currentState!.pushReplacementNamed(
            Routes.homeScreen,
          ),
        ),
      ],
    );
  }
}
