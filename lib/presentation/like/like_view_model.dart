import 'package:flutter/material.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';

class LikeScreenViewModel extends ChangeNotifier {
  List<Quotes> likedQuotes = [];

  void likeQuote(Quotes quote) {
    likedQuotes.add(quote);
    notifyListeners();
  }

  void unlikeQuote(Quotes quote) {
    likedQuotes.remove(quote);
    notifyListeners();
  }

  bool isQuoteLiked(Quotes quote) {
    return likedQuotes.contains(quote);
  }
}
