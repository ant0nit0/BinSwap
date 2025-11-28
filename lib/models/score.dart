import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_abstract_class_inherits_abstract_member

part 'score.freezed.dart';
part 'score.g.dart';

@freezed
abstract class Score with _$Score {
  const factory Score({required int value, required double timeInSec}) = _Score;

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  static List<Score> fromJsonList(List<dynamic> json) {
    return json.map((e) => Score.fromJson(e)).toList();
  }
}
