import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/kswitch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.5),
      body: const Center(
        child: KSwitch(initialValue: true),
      ),
    );
  }
}
