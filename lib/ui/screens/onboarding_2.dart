import 'package:flutter/material.dart';
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
            children: const [
              TextSpan(
                text: 'Every year, over ',
              ),
              TextSpan(
                text: '2 billion ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'tonnes of waste are produced worldwide.'),
            ],
          ),
        ),
        Image.asset(
          'assets/images/icons/other/all_items.png',
        ),
        Text('On the other hand, only around 10% of waste is recycled.',
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
