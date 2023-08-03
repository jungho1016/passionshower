import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/like_repositoy.dart';
import 'package:passionshower/domain/use_case/get_random_quote_use_case.dart';

@lazySingleton
class MainViewModel extends ChangeNotifier {
  final GetRandomQuoteUseCase _getRandomQuoteUseCase;
  final LikeRepository _repository;

  List<Quotes> _quotes = [];
  List<Quotes> _likedQuotes = [];

  MainViewModel(this._getRandomQuoteUseCase, this._repository) {
    fetch();
    loadLikedQuotes();
  }

  List<Quotes> get quotes => _quotes;

  List<Quotes> get likedQuotes => _likedQuotes;

  Future<void> fetch() async {
    // Fetch quotes data from the repository
    final quotes = await _getRandomQuoteUseCase.excute();
    _quotes = quotes;
    notifyListeners();
  }

  Future<void> loadLikedQuotes() async {
    // Load liked quotes from LikeDataSource
    await _repository.likeLoad();
    _likedQuotes = _repository.likedQuotes;
    notifyListeners();
  }

  void onTapFavorite(Quotes quote) {
    if (_likedQuotes.contains(quote)) {
      _repository.unlikeQuote(quote);
    } else {
      _repository.likeQuote(quote);
    }
    // Save the liked quotes to Shared Preferences
    _repository.likeSave();
    loadLikedQuotes(); // Refresh liked quotes list
  }
}
