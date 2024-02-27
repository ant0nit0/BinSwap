// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flame/components.dart';
import 'package:recycling_master/game/components/game_snowflake.dart';
import 'package:recycling_master/game/components/game_x2.dart';
import 'package:recycling_master/game/kgame.dart';

class GameSpecialItemSpawner extends Component with HasGameRef<KGame> {
  /// The random generator used to generate the items
  /// If not provided, a new one will be created
  final Random _random;

  /// The minimum period between snow item generations
  double _snowMinPeriod;

  /// The maximum period between snow item generations
  double _snowMaxPeriod;

  late final SpawnComponent? _snowSpawner;

  /// The minimum period between x2 item generations
  final double _x2MinPeriod;

  /// The maximum period between x2 item generations
  final double _x2MaxPeriod;

  late final SpawnComponent? _x2Spawner;

  GameSpecialItemSpawner({
    double snowMinPeriod = 15,
    double snowMaxPeriod = 35,
    double x2MinPeriod = 5,
    double x2MaxPeriod = 10,
    Random? random,
  })  : _random = random ?? Random(),
        _snowMinPeriod = snowMinPeriod,
        _snowMaxPeriod = snowMaxPeriod,
        _x2MinPeriod = x2MinPeriod,
        _x2MaxPeriod = x2MaxPeriod;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _snowSpawner = SpawnComponent.periodRange(
      factory: (_) => GameSnowflake(),
      minPeriod: _snowMinPeriod,
      maxPeriod: _snowMaxPeriod,
      selfPositioning: false,
      random: _random,
    );

    _x2Spawner = SpawnComponent.periodRange(
      factory: (_) => GameX2(),
      minPeriod: _x2MinPeriod,
      maxPeriod: _x2MaxPeriod,
      selfPositioning: false,
      random: _random,
    );

    await add(_snowSpawner!);
    await add(_x2Spawner!);
  }

  /// Method to update the minimum and maximum periods between item generations
  void updateSnowPeriods(double minPeriod, double maxPeriod) {
    _snowMinPeriod = minPeriod;
    _snowMaxPeriod = maxPeriod;
    // Update the spawner with new period values
    _snowSpawner?.minPeriod = minPeriod;
    _snowSpawner?.maxPeriod = maxPeriod;
  }
}
