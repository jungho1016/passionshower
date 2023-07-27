import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'goal.freezed.dart';

part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    required String title,
    required String content,
    required int color,
    required int timestamp,
  }) = _Goal;

  factory Goal.fromJson(Map<String, Object?> json) => _$GoalFromJson(json);
}
