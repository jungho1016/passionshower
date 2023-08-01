import 'package:flutter/material.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/like_repositoy.dart';

class LikeScreenViewModel extends ChangeNotifier {
  final LikeRepository _repository;

  LikeScreenViewModel(this._repository);

  List<Quotes> get likedQuotes => List.unmodifiable(_repository.likedQuotes);

  void unlikeQuote(Quotes quote) {
    _repository.likedQuotes.remove(quote);
    _repository.likeSave();
    notifyListeners();
  }
}
