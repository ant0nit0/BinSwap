import 'package:flutter/material.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class BinListItem extends StatelessWidget {
  final Bin bin;
  const BinListItem(
    this.bin, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: binBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultSmallPadding, vertical: kDefaultTinyPadding),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  // FIXME: Turn it into another widget, creating the bins from the colors preferences and adding the icons to the bins
                  'assets/images/icons/bins/blue.png',
                  width: 46.0,
                  height: 46.0,
                ),
                const SizedBox(width: kDefaultSmallPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bin.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: neutralDark,
                            fontSize: 14.0,
                            fontFamily: 'LilitaOne'),
                      ),
                      Text(
                        bin.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: neutralDark, fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
