import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarms.freezed.dart';
part 'alarms.g.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String json) {
    final parts = json.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  @override
  String toJson(TimeOfDay object) {
    return '${object.hour}:${object.minute}';
  }
}

@freezed
class Alarms with _$Alarms {
  const factory Alarms({
    int? id,
    required int dayOfTheWeek,
    @TimeOfDayConverter() required TimeOfDay timeOfDay,
    bool? isActive,
  }) = _Alarms;

  factory Alarms.fromJson(Map<String, dynamic> json) => _$AlarmsFromJson(json);
}
