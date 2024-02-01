import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameModalOverlay extends HookWidget {
  final String? title;

  final Widget? child;

  const GameModalOverlay({
    this.child,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultSmallPadding)
          .copyWith(bottom: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _dragger(),
          if (title != null) ...[
            _title(context),
            _divider(),
            const SizedBox(height: kDefaultTinyPadding),
          ],
          if (child != null) child!,
        ],
      ),
    );
  }

  Widget _dragger() => Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: grayDraggerColor),
          height: 4.0,
          width: 32.0,
        ),
      );

  Widget _title(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding, bottom: kDefaultTinyPadding),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: neutralDark,
                fontFamily: 'LilitaOne',
                fontSize: 20.0,
              ),
        ),
      );

  Widget _divider() => const Padding(
        padding: EdgeInsets.only(bottom: kDefaultSmallPadding),
        child: Divider(
          color: grayBorderColor,
        ),
      );
}
