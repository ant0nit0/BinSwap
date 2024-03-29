import 'dart:async';
import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/audio/sfx_service.dart';
import 'package:recycling_master/game/components/game_item.dart';
import 'package:recycling_master/game/components/game_item_spawner.dart';
import 'package:recycling_master/game/components/game_level_bar.dart';
import 'package:recycling_master/game/components/game_special_items_spawner.dart';
import 'package:recycling_master/game/components/game_text_level.dart';
import 'package:recycling_master/game/components/game_text_score.dart';
import 'package:recycling_master/game/components/game_text_time.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/game/components/game_background.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/components/game_column.dart';
import 'package:recycling_master/game/components/game_life_bar.dart';
import 'package:recycling_master/models/level.dart';
import 'package:recycling_master/providers/tutorial_state.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/utils/constants.dart';

class KGame extends FlameGame
    with
        HorizontalDragDetector,
        VerticalDragDetector,
        HasCollisionDetection,
        TapDetector {
  final WidgetRef ref;

  final bool isTutorial;
  final tutorialHasBeenDone = ValueNotifier(false);

  /// The position where the drag started.
  /// Used to determine the column where the drag started and calculate the bins to swap.
  Vector2? _dragStartPosition;

  /// The [GameItemSpawner] used to spawn the items.
  /// We need to keep a reference to it to be able to remove the items from it.
  final GameItemSpawner _itemSpawner;

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

  final Map<int, List<GameItem?>> itemPerColumn = {};

  /// The level notifier, used to keep track of the current level
  final levelNotifier = ValueNotifier(Level.one());

  /// The numbers of items sorted for the current level.
  /// Used to increase the level when the number of items sorted
  /// reaches the number of items to sort for the current level.
  final itemCountForLevel = ValueNotifier(0);

  final itemSpeedFactor = ValueNotifier(1.0);
  final scoreFactor = ValueNotifier(1);

  KGame(
    this.state,
    this.ref, {
    this.isTutorial = false,
  }) : _itemSpawner = GameItemSpawner(state.items);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    if (isTutorial && !tutorialHasBeenDone.value) {
      levelNotifier.value = Level.tutorial();
      _itemSpawner.updatePeriods(
        levelNotifier.value.minPeriod,
        levelNotifier.value.maxPeriod,
      );
    }
    _addAllComponents();
  }

  Future<void> _launchTutorial() async {
    ref.read(tutorialStateNotifierProvider.notifier).reset();
    await Future.delayed(const Duration(milliseconds: 2500), () {
      pauseEngine();
      overlays.add(GameScreen.tutorial1);
    });
  }

  Future<void> _addAllComponents() async {
    // Adding the background, columns and bins
    await add(GameBackground(state.backgroundPath));
    await _loadColumnsAndBins();
    await _loadTopComponents();

    // Launch the spawning of the items
    await add(_itemSpawner);
    final specialSpawner = GameSpecialItemSpawner();
    await add(specialSpawner);

    if (isTutorial && !tutorialHasBeenDone.value) {
      _launchTutorial();
    }
  }

  Future<void> _loadTopComponents() async {
    // Adding the score, time and lifeBar components
    await add(GameTextScore());
    await add(GameTextTime());
    await add(GameTextLevel(launchAnimationOnFirstLevel: !isTutorial));
    await add(GameLevelBar());
    await add(GameLifeBar());

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
  void onVerticalDragStart(DragStartInfo info) {
    super.onVerticalDragStart(info);

    // Get the column index where the drag started
    final columnIndex =
        (info.eventPosition.global.x / (size.x / state.nbCol)).floor();

    final itemList = itemPerColumn[columnIndex];
    if (itemList == null || itemList.isEmpty) return;
    final firstItem = itemList.first;
    if (firstItem != null) {
      firstItem.accelerate();
      itemPerColumn[columnIndex]!.remove(firstItem);
    }
  }

  void addItemPerColumn(int columnIndex, GameItem item) {
    // Check if a list is already present for this index
    if (itemPerColumn.containsKey(columnIndex)) {
      itemPerColumn[columnIndex]!.add(item);
    } else {
      itemPerColumn[columnIndex] = [item];
    }
  }

  void removeItemPerColumn(int columnIndex, GameItem item) {
    if (!itemPerColumn.containsKey(columnIndex)) return;
    itemPerColumn[columnIndex]!.remove(item);
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
    ref.read(sfxServiceProvider).playSwipeSound();
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
    ref.read(sfxServiceProvider).playCorrectCategorySound();
    scoreNotifier.value += score * scoreFactor.value;
    sortedItemsNotifier.value += 1;
    itemCountForLevel.value += 1;
    lifeNotifier.value = min(defaultLife, lifeNotifier.value + 0.2);
    if (itemCountForLevel.value >= levelNotifier.value.nbItemsToSort) {
      itemCountForLevel.value = 0;
      scoreNotifier.value += levelNotifier.value.score;
      _increaseLevel();
      // TODO: Play sound for level up
    }
  }

  void _increaseLevel() {
    final nextLevel = Level(
      number: levelNotifier.value.number + 1,
      nbItemsToSort: (levelNotifier.value.nbItemsToSort * 1.2).round(),
      itemOpacity: max(0, levelNotifier.value.itemOpacity - .075),
      itemSpeed:
          min(kMaxItemSpeed, (levelNotifier.value.itemSpeed * 1.2).round()),
      score: (levelNotifier.value.score + 5),
      minPeriod: levelNotifier.value.minPeriod * 0.8,
      maxPeriod: levelNotifier.value.maxPeriod * 0.8,
    );
    levelNotifier.value = nextLevel;
    _itemSpawner.updatePeriods(
      levelNotifier.value.minPeriod,
      levelNotifier.value.maxPeriod,
    );
  }

  Future<void> decreaseScore({double value = 1.0}) async {
    lifeNotifier.value -= value;
    if (lifeNotifier.value <= 0) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        pauseEngine();
      });
      await Future.delayed(const Duration(milliseconds: 500), () {
        overlays.add(GameScreen.endGameDialogKey);
      });
    } else {
      scoreNotifier.value = max(0, scoreNotifier.value - 1);
    }
  }

  Future<void> launchGameAfterTutorial() async {
    overlays.remove(GameScreen.tutorial1);
    levelNotifier.value = Level.one();
    _itemSpawner.updatePeriods(
      levelNotifier.value.minPeriod,
      levelNotifier.value.maxPeriod,
    );
    _itemSpawner.clear();
    lifeNotifier.value = defaultLife;
    scoreNotifier.value = 0;
    timeNotifier.value = 0;
    sortedItemsNotifier.value = 0;
    itemCountForLevel.value = 0;
    tutorialHasBeenDone.value = true;
    resumeEngine();
  }

  void freeze() async {
    itemSpeedFactor.value = 0.2;
    _itemSpawner.updatePeriods(
      levelNotifier.value.minPeriod * 3,
      levelNotifier.value.maxPeriod * 3,
    );
    overlays.add(GameScreen.snow);
    unawaited(
      Future.delayed(
        const Duration(milliseconds: kFreezeDuration ~/ 1.75),
        () {
          _itemSpawner.updatePeriods(
            levelNotifier.value.minPeriod,
            levelNotifier.value.maxPeriod,
          );
        },
      ),
    );
    unawaited(
      Future.delayed(
        const Duration(milliseconds: kFreezeDuration),
        () {
          itemSpeedFactor.value = 1;
          overlays.remove(GameScreen.snow);
        },
      ),
    );
  }

  void x2() async {
    scoreFactor.value = 2;
    overlays.add(GameScreen.fire);
    unawaited(
      Future.delayed(
        const Duration(milliseconds: kX2Duration),
        () {
          scoreFactor.value = 1;
          overlays.remove(GameScreen.fire);
        },
      ),
    );
  }
}
