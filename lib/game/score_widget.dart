import 'package:flutter/material.dart';
import 'package:recycling_master/utils/colors.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get the score from a provider
    return RichText(
      text: TextSpan(
        text: 'Score:\t\t\t',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontFamily: 'LilitaOne',
              fontSize: 40.0,
              color: neutralLight,
            ),
        children: const [
          TextSpan(
            text: '0',
            style: TextStyle(color: yellowMainColor),
          ),
        ],
      ),
    );
  }
}
