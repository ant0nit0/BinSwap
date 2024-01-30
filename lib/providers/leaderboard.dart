import 'dart:convert';

import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard.g.dart';

@Riverpod(keepAlive: true)
class Leaderboard extends _$Leaderboard {
  @override
  FutureOr<List<Score>> build() async {
    state = const AsyncLoading();

    await _loadFromStorage();

    return state.valueOrNull ?? <Score>[];
  }

  Future<void> _loadFromStorage() async {
    final storedScores = await ref
        .read(storageServiceProvider)
        .storage
        .read(key: StorageKeys.leaderboard);

    if (storedScores != null) {
      final scores = Score.fromJsonList(json.decode(storedScores));
      state = AsyncData(scores);
    } else {
      state = const AsyncData(<Score>[]);
    }
  }

  Future<void> addScore(Score score) async {
    // await _loadFromStorage();
    final scores = [...state.value ?? <Score>[]];
    scores.add(score);
    // Sort scores on value, and on time if values are equals
    scores.sort((a, b) {
      final valueComparison = b.value.compareTo(a.value);
      if (valueComparison != 0) {
        return valueComparison;
      }
      return a.timeInSec.compareTo(b.timeInSec);
    });

    if (scores.length > kNumberOfStoredScores) {
      scores.removeRange(kNumberOfStoredScores, scores.length);
    }

    await ref.read(storageServiceProvider).storage.write(
          key: StorageKeys.leaderboard,
          value: json.encode(scores),
        );

    state = AsyncData([...scores]);
  }

  Score? get highScore {
    final scores = state.valueOrNull;
    if (scores == null || scores.isEmpty) {
      return null;
    }

    return scores.first;
  }
}
