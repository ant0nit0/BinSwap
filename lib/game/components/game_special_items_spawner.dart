// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flame/components.dart';
import 'package:recycling_master/game/components/game_snowflake.dart';
import 'package:recycling_master/game/kgame.dart';

class GameSpecialItemSpawner extends Component with HasGameRef<KGame> {
  final List<dynamic> _spawnedItems = [];

  /// The random generator used to generate the items
  /// If not provided, a new one will be created
  final Random _random;

  /// The minimum period between item generations
  double _minPeriod;

  /// The maximum period between item generations
  double _maxPeriod;

  SpawnComponent? _spawner;

  GameSpecialItemSpawner(
      {double minPeriod = 15, double maxPeriod = 35, Random? random})
      : _random = random ?? Random(),
        _minPeriod = minPeriod,
        _maxPeriod = maxPeriod;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _spawner = SpawnComponent.periodRange(
      factory: (_) {
        final i = GameSnowflake();
        _spawnedItems.add(i);
        return i;
      },
      minPeriod: _minPeriod,
      maxPeriod: _maxPeriod,
      selfPositioning: false,
      random: _random,
    );
    print('Special items spawner created');

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
    for (var element in _spawnedItems) {
      element.removeFromParent();
    }
    _spawnedItems.clear();
  }
}
