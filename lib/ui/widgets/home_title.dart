import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'RECYCLING\nMASTER',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: greenTextColor,
            fontFamily: 'Lilitaone',
            fontSize: 48.0,
            height: 1.0,
          ),
      textAlign: TextAlign.center,
    );
  }
}
