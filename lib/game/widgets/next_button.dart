import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/ui/widgets/kanimate.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class NextButtonWidget extends HookWidget {
  final Function? beforeAnimationCallback;
  final Function? afterAnimationCallback;
  final AnimationController? controller;
  final String text;
  const NextButtonWidget({
    this.beforeAnimationCallback,
    this.afterAnimationCallback,
    this.controller,
    this.text = 'NEXT',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(color: neutralLight, fontSize: 16.0, height: 1.3);
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = controller ??
        useAnimationController(
          duration: const Duration(milliseconds: 600),
        );
    return GestureDetector(
      onTap: () async {
        beforeAnimationCallback?.call();
        await _controller.reverse();
        afterAnimationCallback?.call();
      },
      child: KAnimate(
        controller: _controller,
        slideDirection: SlideDirection.downToUp,
        child: Row(
          children: [
            const Spacer(),
            Text(
              text,
              style: ts.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: kDefaultTinyPadding,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: neutralLight,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
