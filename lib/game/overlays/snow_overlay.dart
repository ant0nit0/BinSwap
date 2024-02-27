import 'package:flutter/material.dart';

class SnowOverlay extends StatelessWidget {
  const SnowOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IgnorePointer(
      child: Opacity(
        opacity: 0.6,
        child: Image.asset(
          'assets/images/overlays/snow.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
