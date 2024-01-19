import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String name;
  static const bgPath = 'assets/images/backgrounds';
  const BackgroundImage(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        '$bgPath/$name.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
