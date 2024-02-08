import 'package:recycling_master/audio/background_audio_state_notifier.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/providers/bin_colors.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class GameStateNotifier extends _$GameStateNotifier {
  @override
  GameState build() {
    _initState();
    return state;
  }

  void _initState() {
    final bins = chooseBins();
    final categories = bins.map((e) => e.category).toSet();
    final items = allItems
        .where((element) => categories.contains(element.category))
        .toList();

    state = GameState(
      bins: bins,
      items: items,
    );
  }

  List<Bin> chooseBins() {
    List<Bin> bins = [...allBins];
    // Randomly pick 3 bins
    bins.shuffle();
    bins.removeRange(3, bins.length);
    // Create new bin instances with their colors fetched from the BinColors provider
    final list = bins.map((e) {
      final color = ref.read(binColorsProvider.notifier).getColor(e.category);
      return Bin(
        category: e.category,
        color: color,
        title: e.title,
        description: e.description,
      );
    }).toList();

    return list;
  }

  Future<void> refresh() async {
    _initState();
    await ref
        .read(backgroundAudioStateNotifierProvider.notifier)
        .refreshGameMusic();
  }

  void reset() {
    _initState();
    ref.read(backgroundAudioStateNotifierProvider.notifier).resetGameMusic();
  }
}
