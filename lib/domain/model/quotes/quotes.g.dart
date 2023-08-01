// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quotes _$$_QuotesFromJson(Map<String, dynamic> json) => _$_Quotes(
      author: json['author'] as String,
      job: json['job'] as String,
      message: json['message'] as String,
      id: json['id'] as num,
    );

Map<String, dynamic> _$$_QuotesToJson(_$_Quotes instance) => <String, dynamic>{
      'author': instance.author,
      'job': instance.job,
      'message': instance.message,
      'id': instance.id,
    };
