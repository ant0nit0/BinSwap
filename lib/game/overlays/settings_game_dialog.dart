import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/game/widgets/blurred_scaffold.dart';

class SettingsGameOverlay extends StatelessWidget {
  const SettingsGameOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurredScaffold(
      title: translate('game.settings.title'),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
