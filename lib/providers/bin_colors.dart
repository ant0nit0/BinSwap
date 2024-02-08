import 'package:recycling_master/utils/bin_enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bin_colors.g.dart';

@Riverpod(keepAlive: true)
class BinColors extends _$BinColors {
  @override
  Map<BinCategory, BinColor> build() {
    state = {
      BinCategory.papers: BinColor.orange,
      BinCategory.plastics: BinColor.blue,
      BinCategory.glass: BinColor.gray,
      BinCategory.textiles: BinColor.purple,
      BinCategory.organics: BinColor.green,
      BinCategory.electronics: BinColor.red,
    };
    return state;
  }

  BinColor getColor(BinCategory category) {
    return state[category]!;
  }

  /// Set a new [color] for the given [category].
  ///
  /// The function automatically assign the previous color to the category
  /// that previously had the [color].
  void setColor(BinCategory category, BinColor color) {
    final previousCategory =
        state.entries.firstWhere((element) => element.value == color).key;
    state[previousCategory] = state[category]!;
    state[category] = color;
  }
}
