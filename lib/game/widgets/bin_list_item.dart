import 'package:flutter/material.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/bin_enums.dart';

class BinListItem extends StatelessWidget {
  final BinCategory category;
  const BinListItem(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement UI
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              KSVG(''),
              Text(''),
              Text(''),
            ],
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
