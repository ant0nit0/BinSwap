import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recycling_master/utils/theme.dart';

class SettingsGameOverlay extends StatelessWidget {
  const SettingsGameOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.75),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(kDefaultLargePadding),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
