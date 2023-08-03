import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'my_home_event.freezed.dart';

@freezed
sealed class MyHomeEvent<T> with _$MyHomeEvent<T> {
  const factory MyHomeEvent.action(T data) = action;
}
