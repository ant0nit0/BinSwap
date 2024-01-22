import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/ui/widgets/rounded_icon_button.dart';

class SoundToggleButton extends HookWidget {
  const SoundToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isSoundOn = useState(true);
    return RoundedIconButton(
      // FIXME: use sound controller
      icon: KSVG('sound_${isSoundOn.value ? 'on' : 'off'}'),
      onPressed: () {
        isSoundOn.value = !isSoundOn.value;
      },
    );
  }
}
