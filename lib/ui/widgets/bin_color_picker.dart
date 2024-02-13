// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/ui/widgets/bin_color_picker_item.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/colors.dart';

class BinColorPicker extends HookConsumerWidget {
  final BinCategory category;
  final void Function(BinCategory, BinColor) onColorSelected;
  const BinColorPicker({
    required this.category,
    required this.onColorSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(binColorsProvider);

    return state.when(
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator(),
        data: (data) {
          final color = useState(data[category]!);
          return Container(
            decoration: BoxDecoration(
              color: neutralLight,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                for (final col in BinColor.values)
                  GestureDetector(
                    onTap: () => onColorSelected(category, col),
                    child: BinColorPickerItem(
                      baseCategory: category,
                      color: col,
                      isSelected: col == color.value,
                    ),
                  )
              ],
            ),
          );
        });
  }
}
