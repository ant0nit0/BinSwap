import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/utils/colors.dart';

class KSwitch extends HookWidget {
  final bool initialValue;
  final Function()? onActivate;
  final Function()? onDeactivate;
  final double width;
  const KSwitch({
    required this.initialValue,
    this.onActivate,
    this.onDeactivate,
    this.width = 70.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActivate = useState(initialValue);
    final height = width / 1.25;

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );

    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          activeColor: neutralLight,
          activeTrackColor: neutralDark,
          inactiveThumbColor: neutralDark,
          value: isActivate.value,
          thumbIcon: thumbIcon,
          onChanged: (bool val) {
            isActivate.value = val;
            if (isActivate.value) {
              onActivate?.call();
            } else {
              onDeactivate?.call();
            }
          },
        ),
      ),
    );
  }
}
