import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
              TextSpan(
                text: translate('onBoarding.2.1'),
              ),
              TextSpan(
                text: translate('onBoarding.2.2'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: translate('onBoarding.2.3')),
            ],
          ),
        ),
        Image.asset(
          'assets/images/icons/other/all_items.png',
        ),
        Text(translate('onBoarding.2.4'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: neutralDark,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                )),
      ],
    );
  }
}
