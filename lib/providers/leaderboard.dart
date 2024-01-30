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
    final scores = [...state.value ?? <Score>[]];
    scores.add(score);
    final sortedScores = _sortAndCrop([...scores]);

    await ref.read(storageServiceProvider).storage.write(
          key: StorageKeys.leaderboard,
          value: json.encode(sortedScores),
        );

    state = AsyncData([...sortedScores]);
  }

  /// Sorts the [scores] according to their value, and time if the value is the same.
  ///
  /// Then crops the list to the maximum number of stored scores, according to [kNumberOfStoredScores].
  ///
  /// Returns the sorted and cropped list.
  List<Score> _sortAndCrop(List<Score> scores) {
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

    return scores;
  }

  Score? get highScore {
    final scores = state.valueOrNull;
    if (scores == null || scores.isEmpty) {
      return null;
    }

    return scores.first;
  }
}
