import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/models/game_state.dart';
import 'package:recycling_master/game/components/game_background.dart';
import 'package:recycling_master/game/components/game_bin.dart';
import 'package:recycling_master/game/components/game_column.dart';
import 'package:recycling_master/game/components/game_item.dart';
import 'package:recycling_master/game/components/game_life_bar.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/theme.dart';
import 'package:recycling_master/utils/utils.dart';

class KGame extends FlameGame
    with HorizontalDragDetector, HasCollisionDetection {
  /// The position where the drag started.
  /// Used to determine the column where the drag started and calculate the bins to swap.
  Vector2? _dragStartPosition;

  /// The direction of the drag.
  /// 1 for right, -1 for left, 0 when idle
  int _dragDirection = 0;

  /// In the [scoreNotifier] we keep track of what the current score is, and if
  /// other parts of the code is interested in when the score is updated they
  /// can listen to it and act on the updated value.
  final scoreNotifier = ValueNotifier(0);

  /// In the [timeNotifier] we keep track of the time elapsed since the game started
  final timeNotifier = ValueNotifier(0.0);

  /// In the [lifeNotifier] we keep track of the number of lives left
  /// When an item fall in a wrong bin, we decrease the value by 1
  /// When the value reaches 0, the game is over
  final lifeNotifier = ValueNotifier(defaultLife);

  /// The state of the game, contains the categories selected for the game
  /// and the items corresponding to these categories
  final GameState state;

  /// A map of the columns indexes and their corresponding bins
  /// Used to keep track of the bins positions when swapping them
  final Map<int, GameBin> columnBinMap = {};

  /// The random generator used to generate the items
  /// If not provided, a new one will be created
  final Random _random;

  KGame(
    this.state, {
    Random? random,
  }) : _random = random ?? Random();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Adding the background, columns and bins
    await add(GameBackground());
    await _loadColumnsAndBins();

    // Adding the score, time and lifeBar components
    await _loadScoreComponent();
    await _loadTimeComponent();
    await add(GameLifeBar());

    // Launch the spawing of the items
    await _initItemSpawner();

    overlays.add(GameScreen.topIconsKey);
    overlays.add(GameScreen.pausePlayKey);
  }

  Future<void> _loadTimeComponent() async {
    final textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
    );

    final timeText = 'Time : ${timeNotifier.value}';

    final timeComponent = TextComponent(
      text: timeText,
      position: Vector2(kDefaultPadding, size.y * 0.2),
      textRenderer: textRenderer,
    );

    timeNotifier.addListener(() {
      timeComponent.text =
          'Time : ${timeNotifier.value < 10 ? '0' : ''}${timeNotifier.value}';
    });
    timeComponent.text = 'Time : 0';
    return await add(timeComponent);
  }

  Future<void> _loadScoreComponent() async {
    final textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'LilitaOne',
      ),
    );

    final scoreText = 'Score : $scoreNotifier';

    final scoreComponent = TextComponent(
      text: scoreText,
      position: Vector2(kDefaultPadding, size.y * 0.15),
      textRenderer: textRenderer,
    );

    scoreNotifier.addListener(() {
      scoreComponent.text = 'Score : ${scoreNotifier.value}';
    });
    scoreComponent.text = 'Score : 0';
    return await add(scoreComponent);
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

  Future<void> _initItemSpawner() async {
    return await add(
      SpawnComponent.periodRange(
        factory: (_) {
          final i = state.items[_random.nextInt(state.items.length)];
          return GameItem(
            item: i,
            color: getColorFromBin(i.category),
          );
        },
        minPeriod: 1,
        maxPeriod: 3, // FIXME : Change this to increase difficulty
        selfPositioning: false,
        random: _random,
      ),
    );
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
      int columnIndex =
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

    if (kDebugMode) {
      print(
          'Swapping bins ${bin1Component.bin.category.name} and ${bin2Component.bin.category.name}');
    }
  }
}
