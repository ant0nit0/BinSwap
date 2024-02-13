import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/bin_image.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/ui/widgets/bin_color_picker.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class ColorDistributionItem extends HookConsumerWidget {
  final BinCategory category;
  final GlobalKey gkey;

  const ColorDistributionItem(this.category, {required this.gkey, super.key});

  Offset _getWidgetPosition() {
    RenderBox renderBox = gkey.currentContext?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    // Get the size
    // You now have the position of the widget in global coordinates.
    return position;
  }

  Size _getWidgetSize() {
    RenderBox renderBox = gkey.currentContext?.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    return size;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the OverlayPortalController
    final OverlayPortalController tooltipController =
        useMemoized(() => OverlayPortalController(), [gkey]);

    final state = ref.watch(binColorsProvider);

    void onColorSelected(BinCategory cat, BinColor col) {
      ref.read(binColorsProvider.notifier).setColor(cat, col);
      tooltipController.hide();
    }

    return state.when(
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator(),
        data: (data) {
          final color = data[category]!;
          return FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: LayoutBuilder(
                builder: (ctx, constraints) => GestureDetector(
                  key: gkey,
                  onTap: () => tooltipController.toggle(),
                  child: Row(
                    children: [
                      BinImage(color: color, category: category),
                      const SizedBox(
                        width: kDefaultSmallPadding,
                      ),
                      Text(
                        translate('game.infos.bins.${category.name}.title'),
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'LilitaOne',
                          color: neutralDark,
                        ),
                      ),
                      const SizedBox(
                        width: kDefaultPadding,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: getColorFromBinColor(color),
                            shape: BoxShape.circle),
                        height: 40,
                        width: 40,
                        child: OverlayPortal(
                          controller: tooltipController,
                          overlayChildBuilder: (BuildContext context) {
                            final pos = _getWidgetPosition();
                            final size = _getWidgetSize();
                            return Positioned(
                                left: pos.dx + size.width / 2,
                                top: pos.dy - size.height / 2,
                                child: BinColorPicker(
                                  category: category,
                                  onColorSelected: onColorSelected,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
