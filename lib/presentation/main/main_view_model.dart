import 'package:flutter/material.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

// class MainScreenViewModel extends ChangeNotifier {
//   final QuotesRepository _repository;
//   final LikeDataSource _likeDataSource;
//
//   List<Quotes> _quotes = [];
//
//   MainScreenViewModel(this._repository, this._likeDataSource) {
//     fetch();
//   }
//
//   List<Quotes> get quotes => _quotes;
//
//   List<Quotes> get likedQuotes =>
//       List.unmodifiable(_likeDataSource.likedQuotes);
//
//   Future<void> fetch() async {
//     // Fetch quotes data from the repository
//     final quotes = await _repository.fetch();
//     _quotes = quotes;
//     notifyListeners();
//   }
//
//   void onTapFavorite(Quotes quote) {
//     if (_likeDataSource.likedQuotes.contains(quote)) {
//       _likeDataSource.unlikeQuote(quote);
//     } else {
//       _likeDataSource.likeQuote(quote);
//     }
//     notifyListeners();
//   }
// }

class MainScreenViewModel extends ChangeNotifier {
  final QuotesRepository _repository;
  final LikeDataSource _likeDataSource;

  List<Quotes> _quotes = [];
  List<Quotes> _likedQuotes = [];

  MainScreenViewModel(this._repository, this._likeDataSource) {
    fetch();
    loadLikedQuotes();
  }

  List<Quotes> get quotes => _quotes;

  List<Quotes> get likedQuotes => _likedQuotes;

  Future<void> fetch() async {
    // Fetch quotes data from the repository
    final quotes = await _repository.fetch();
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
