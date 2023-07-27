import 'package:flutter/material.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';

class LikedQuotesViewModel extends ChangeNotifier {
  List<Quotes> likedQuotes = [];

  void addLikedQuote(Quotes quote) {
    likedQuotes.add(quote);
    notifyListeners();
  }

  void removeLikedQuote(Quotes quote) {
    likedQuotes.remove(quote);
    notifyListeners();
  }
}
