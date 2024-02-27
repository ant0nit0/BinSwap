import 'package:flutter/material.dart';

class FireOverlay extends StatelessWidget {
  const FireOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IgnorePointer(
      child: Opacity(
        opacity: 0.6,
        child: Image.asset(
          'assets/images/overlays/fire.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
