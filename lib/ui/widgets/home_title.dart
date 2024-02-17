import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BINSWAP',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: neutralDark,
                fontFamily: 'Lilitaone',
                fontSize: 48.0,
                height: 1.0,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Swipe & Sort',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: neutralDark,
                fontFamily: 'Lilitaone',
                fontSize: 24.0,
                height: 1.0,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
