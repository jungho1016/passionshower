import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quotes.freezed.dart';

part 'quotes.g.dart';

@freezed
class Quotes with _$Quotes {
  const factory Quotes({
    required String author,
    required String job,
    required String message,
    required num id,
  }) = _Quotes;

  factory Quotes.fromJson(Map<String, Object?> json) => _$QuotesFromJson(json);
}
