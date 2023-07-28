import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';

class LikeScreenViewModel extends ChangeNotifier {
  final LikeDataSource _likeDataSource;

  LikeScreenViewModel(this._likeDataSource);

  List<Quotes> get likedQuotes => List.unmodifiable(_likeDataSource.likedQuotes);

  void unlikeQuote(Quotes quote) {
    _likeDataSource.likedQuotes.remove(quote);
    notifyListeners();
  }

}
