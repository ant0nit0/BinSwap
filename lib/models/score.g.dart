// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Score _$ScoreFromJson(Map<String, dynamic> json) => _Score(
  value: (json['value'] as num).toInt(),
  timeInSec: (json['timeInSec'] as num).toDouble(),
);

Map<String, dynamic> _$ScoreToJson(_Score instance) => <String, dynamic>{
  'value': instance.value,
  'timeInSec': instance.timeInSec,
};
