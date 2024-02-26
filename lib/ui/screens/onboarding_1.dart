import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/home_title.dart';
import 'package:recycling_master/utils/colors.dart';

class OnBoardingFirstPage extends StatelessWidget {
  const OnBoardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HomeTitle(),
        Image.asset(
          'assets/images/icons/other/logo_big.png',
        ),
        Text(
            'Because we can play while learning how to preserve our environment',
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
