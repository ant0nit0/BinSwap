import 'package:flutter/material.dart';
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
            children: const [
              TextSpan(
                text: 'BinSwap',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text:
                      '\'s aim is to teach you how to sort waste, so that you can contribute, at your own level, to the preservation of the environment.'),
            ],
          ),
        ),
        Text(
          'All while having fun, of course!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: neutralDark,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
        ),
        KButton.black(
          text: 'Let\'s go !',
          onPressed: () => navigatorKey.currentState!.pushReplacementNamed(
            Routes.homeScreen,
          ),
        ),
      ],
    );
  }
}
