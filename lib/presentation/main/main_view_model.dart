import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/use_case/get_random_quote_use_case.dart';

class MainScreenViewModel extends ChangeNotifier {
  final GetRandomQuoteUseCase _getRandomQuoteUseCase;
  final LikeDataSource _likeDataSource;

  List<Quotes> _quotes = [];
  List<Quotes> _likedQuotes = [];

  MainScreenViewModel(this._likeDataSource, this._getRandomQuoteUseCase) {
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
    await _likeDataSource.likeLoad();
    _likedQuotes = _likeDataSource.likedQuotes;
    notifyListeners();
  }

  void onTapFavorite(Quotes quote) {
    if (_likedQuotes.contains(quote)) {
      _likeDataSource.unlikeQuote(quote);
    } else {
      _likeDataSource.likeQuote(quote);
    }
    // Save the liked quotes to Shared Preferences
    _likeDataSource.likeSave();
    loadLikedQuotes(); // Refresh liked quotes list
  }
}
