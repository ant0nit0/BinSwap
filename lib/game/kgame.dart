import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/game/components/game_item_spawner.dart';
import 'package:recycling_master/game/components/game_text_level.dart';
import 'package:recycling_master/game/components/game_text_score.dart';
import 'package:recycling_master/game/components/game_text_time.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/game/components/game_background.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/components/game_column.dart';
import 'package:recycling_master/game/components/game_life_bar.dart';
import 'package:recycling_master/models/level.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/utils/constants.dart';

class KGame extends FlameGame
    with HorizontalDragDetector, HasCollisionDetection {
  /// The position where the drag started.
  /// Used to determine the column where the drag started and calculate the bins to swap.
  Vector2? _dragStartPosition;

  /// The [GameItemSpawner] used to spawn the items.
  /// We need to keep a reference to it to be able to remove the items from it.
  GameItemSpawner itemSpawner;

  /// The direction of the drag.
  /// 1 for right, -1 for left, 0 when idle
  int _dragDirection = 0;

  /// In the [scoreNotifier] we keep track of what the current score is, and if
  /// other parts of the code is interested in when the score is updated they
  /// can listen to it and act on the updated value.
  final scoreNotifier = ValueNotifier(0);

  /// In the [timeNotifier] we keep track of the time elapsed since the game started.
  final timeNotifier = ValueNotifier(0.0);

  /// In the [lifeNotifier] we keep track of the number of lives left
  /// When an item fall in a wrong bin, we decrease the value by 1
  /// When the value reaches 0, the game is over
  final lifeNotifier = ValueNotifier(defaultLife);

  /// Here we keep a track of the number of items that have
  /// been correctly sorted in the right bin.
  ///
  /// It is used to increase the difficulty of the game
  /// by decreasing the time between the spawn of the items
  /// and by increasing the speed of the items
  final sortedItemsNotifier = ValueNotifier(0);

  /// The state of the game, contains the categories selected for the game
  /// and the items corresponding to these categories
  final GameState state;

  /// A map of the columns indexes and their corresponding bins
  /// Used to keep track of the bins positions when swapping them
  final Map<int, GameBin> columnBinMap = {};

  /// The level notifier, used to keep track of the current level
  final levelNotifier = ValueNotifier(Level.one());

  /// The numbers of items sorted for the current level.
  /// Used to increase the level when the number of items sorted
  /// reaches the number of items to sort for the current level.
  final itemCountForLevel = ValueNotifier(0);

  KGame(
    this.state,
  ) : itemSpawner = GameItemSpawner(state.items);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Adding the background, columns and bins
    await add(GameBackground());
    await _loadColumnsAndBins();

    // Adding the score, time and lifeBar components
    await add(GameTextScore());
    await add(GameTextTime());
    await add(GameTextLevel());
    await add(GameLifeBar());

    // Launch the spawing of the items
    await add(itemSpawner);

    overlays.add(GameScreen.topIconsKey);
    overlays.add(GameScreen.pausePlayKey);
  }

  Future<void> _loadColumnsAndBins() async {
    for (int i = 0; i < state.nbCol; i++) {
      final column = GameColumn(
        columnIndex: i,
      );
      final bin = GameBin(bin: state.bins[i], columnIndex: i);
      columnBinMap[i] = bin;
      // Add the column to the game
      await addAll([column, bin]);
    }
  }

  @override
  void onHorizontalDragStart(DragStartInfo info) {
    _dragStartPosition = info.eventPosition.global;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    _dragDirection = info.delta.global.x.sign.toInt();
  }

  @override
  void onHorizontalDragEnd(DragEndInfo info) {
    super.onHorizontalDragEnd(info);

    if (_dragStartPosition != null) {
      // Calculate the index of the column where the drag started
      final columnIndex =
          (_dragStartPosition!.x / (size.x / state.nbCol)).floor();

      // Determine the bins to swap
      if (_dragDirection == 1 && columnIndex < state.nbCol - 1) {
        // Swap right
        _swapBins(columnIndex, columnIndex + 1);
      } else if (_dragDirection == -1 && columnIndex > 0) {
        // Swap left
        _swapBins(columnIndex, columnIndex - 1);
      }
    }

    // Reset drag information
    _dragStartPosition = null;
    _dragDirection = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update the time
    timeNotifier.value += dt;
    // Set only 2 decimals and put a 0 before if the number is < 10
    timeNotifier.value = double.parse(timeNotifier.value.toStringAsFixed(2));
  }

  void _swapBins(int index1, int index2) {
    // Get the bins from the map
    final bin1Component = columnBinMap[index1];
    final bin2Component = columnBinMap[index2];

    // Swap the bins in the game
    bin1Component!.setNewPosition(index2 * size.x / state.nbCol +
        (size.x / state.nbCol / 2 - bin1Component.size.x / 2));
    bin2Component!.setNewPosition(index1 * size.x / state.nbCol +
        (size.x / state.nbCol / 2 - bin2Component.size.x / 2));

    // Swap the bins in the map
    columnBinMap[index1] = bin2Component;
    columnBinMap[index2] = bin1Component;
  }

  void increaseScore(int score) {
    scoreNotifier.value += score;
    sortedItemsNotifier.value += 1;
    itemCountForLevel.value += 1;
    if (itemCountForLevel.value >= levelNotifier.value.nbItemsToSort) {
      itemCountForLevel.value = 0;
      scoreNotifier.value += levelNotifier.value.score;
      _increaseLevel();
    }
  }

  void _increaseLevel() {
    final nextLevel = Level(
      number: levelNotifier.value.number + 1,
      nbItemsToSort: (levelNotifier.value.nbItemsToSort * 1.2).round(),
      itemOpacity: max(0, levelNotifier.value.itemOpacity - .075),
      itemSpeed: (levelNotifier.value.itemSpeed * 1.2).round(),
      score: (levelNotifier.value.score + 5),
      minPeriod: levelNotifier.value.minPeriod * 0.8,
      maxPeriod: levelNotifier.value.maxPeriod * 0.8,
    );
    levelNotifier.value = nextLevel;
    itemSpawner.updatePeriods(
      levelNotifier.value.minPeriod,
      levelNotifier.value.maxPeriod,
    );
  }

  void decreaseScore() {
    scoreNotifier.value = max(0, scoreNotifier.value - 1);
    lifeNotifier.value -= 1;
    if (lifeNotifier.value <= 0) {
      pauseEngine();
      overlays.add(GameScreen.endGameDialogKey);
    }
  }
}
