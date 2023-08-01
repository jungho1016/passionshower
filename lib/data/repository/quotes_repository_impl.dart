import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  @override
  Future<List<Quotes>> fetch() async {
    try {
      String jsonString = await rootBundle.loadString('assets/quotes1.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> jsonResult = jsonData['DATA'];
      return jsonResult.map((e) => Quotes.fromJson(e)).toList();
    } catch (e) {
      // 예외 처리: JSON 파싱에 실패했을 경우 빈 리스트 반환
      print('Error while fetching quotes: $e');
      return [];
    }
  }
}


