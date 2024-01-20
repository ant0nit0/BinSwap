import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class TimerWidget extends HookConsumerWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = useState(146); // TODO: Get the time from a provider
    const textStyle = TextStyle(
      fontSize: 16.0,
      color: neutralLight,
      fontFamily: 'Montserrat',
    );

    return Row(
      children: [
        const Text(
          'Time: ',
          style: textStyle,
        ),
        const SizedBox(
          width: kDefaultTinyPadding,
        ),
        Text(
          formatTime(time.value),
          style: textStyle,
        ),
      ],
    );
  }
}
