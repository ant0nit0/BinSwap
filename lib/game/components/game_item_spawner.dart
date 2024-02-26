// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flame/components.dart';
import 'package:recycling_master/game/components/game_item.dart';
import 'package:recycling_master/game/kgame.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/utils/utils.dart';

class GameItemSpawner extends Component with HasGameRef<KGame> {
  final List<GameItem> _spawnedItems = [];

  /// The random generator used to generate the items
  /// If not provided, a new one will be created
  final Random _random;

  /// The list of items to spawn
  final List<Item> _items;

  /// The minimum period between item generations
  double _minPeriod;

  /// The maximum period between item generations
  double _maxPeriod;

  SpawnComponent? _spawner;

  List<GameItem> get spawnedItems => _spawnedItems;

  GameItemSpawner(List<Item> items,
      {double minPeriod = 1, double maxPeriod = 3, Random? random})
      : _random = random ?? Random(),
        _items = items,
        _minPeriod = minPeriod,
        _maxPeriod = maxPeriod;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _spawner = SpawnComponent.periodRange(
      factory: (_) {
        final i = _items[_random.nextInt(_items.length)];
        final _color =
            getColorFromBinColor(game.state.colorDistribution[i.category]!);
        final gameItem = GameItem(
          item: i,
          color: _color,
        );
        _spawnedItems.add(gameItem);
        return gameItem;
      },
      minPeriod: _minPeriod,
      maxPeriod: _maxPeriod,
      selfPositioning: false,
      random: _random,
    );

    await add(_spawner!);
  }

  /// Method to update the minimum and maximum periods between item generations
  void updatePeriods(double minPeriod, double maxPeriod) {
    _minPeriod = minPeriod;
    _maxPeriod = maxPeriod;
    // Update the spawner with new period values
    _spawner?.minPeriod = minPeriod;
    _spawner?.maxPeriod = maxPeriod;
  }

  void clear() {
    for (final element in _spawnedItems) {
      element.removeFromParent();
    }
    _spawnedItems.clear();
  }
}
