// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quotes _$QuotesFromJson(Map<String, dynamic> json) {
  return _Quotes.fromJson(json);
}

/// @nodoc
mixin _$Quotes {
  String get author => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotesCopyWith<Quotes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesCopyWith<$Res> {
  factory $QuotesCopyWith(Quotes value, $Res Function(Quotes) then) =
      _$QuotesCopyWithImpl<$Res, Quotes>;
  @useResult
  $Res call({String author, String job, String message});
}

/// @nodoc
class _$QuotesCopyWithImpl<$Res, $Val extends Quotes>
    implements $QuotesCopyWith<$Res> {
  _$QuotesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? job = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuotesCopyWith<$Res> implements $QuotesCopyWith<$Res> {
  factory _$$_QuotesCopyWith(_$_Quotes value, $Res Function(_$_Quotes) then) =
      __$$_QuotesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String author, String job, String message});
}

/// @nodoc
class __$$_QuotesCopyWithImpl<$Res>
    extends _$QuotesCopyWithImpl<$Res, _$_Quotes>
    implements _$$_QuotesCopyWith<$Res> {
  __$$_QuotesCopyWithImpl(_$_Quotes _value, $Res Function(_$_Quotes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? job = null,
    Object? message = null,
  }) {
    return _then(_$_Quotes(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quotes with DiagnosticableTreeMixin implements _Quotes {
  const _$_Quotes(
      {required this.author, required this.job, required this.message});

  factory _$_Quotes.fromJson(Map<String, dynamic> json) =>
      _$$_QuotesFromJson(json);

  @override
  final String author;
  @override
  final String job;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quotes(author: $author, job: $job, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quotes'))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('job', job))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quotes &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, job, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuotesCopyWith<_$_Quotes> get copyWith =>
      __$$_QuotesCopyWithImpl<_$_Quotes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotesToJson(
      this,
    );
  }
}

abstract class _Quotes implements Quotes {
  const factory _Quotes(
      {required final String author,
      required final String job,
      required final String message}) = _$_Quotes;

  factory _Quotes.fromJson(Map<String, dynamic> json) = _$_Quotes.fromJson;

  @override
  String get author;
  @override
  String get job;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_QuotesCopyWith<_$_Quotes> get copyWith =>
      throw _privateConstructorUsedError;
}
