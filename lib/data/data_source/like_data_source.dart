import 'dart:convert';

import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeDataSource {
  List<Quotes> likedQuotes = [];

  void likeQuote(Quotes quote) {
    likedQuotes.add(quote);
  }

  void unlikeQuote(Quotes quote) {
    likedQuotes.remove(quote);
  }

  Future<void> likeSave() async {
    final prefs = await SharedPreferences.getInstance();
    final likedQuotesJsonList =
        likedQuotes.map((quote) => quote.toJson()).toList();
    final likedQuotesStringList =
        likedQuotesJsonList.map((json) => jsonEncode(json)).toList();
    await prefs.setStringList('liked_quotes', likedQuotesStringList);
  }

  Future<void> likeLoad() async {
    final prefs = await SharedPreferences.getInstance();
    final likedQuotesStringList = prefs.getStringList('liked_quotes') ?? [];
    final likedQuotesJsonList = likedQuotesStringList
        .map((jsonString) => jsonDecode(jsonString))
        .toList();
    likedQuotes =
        likedQuotesJsonList.map((json) => Quotes.fromJson(json)).toList();
  }
}
