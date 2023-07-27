import 'package:flutter/material.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

class MainScreenViewModel extends ChangeNotifier {
  final QuotesRepository _repository;
  List<Quotes> _quotes = [];

  MainScreenViewModel(this._repository) {
    fetch();
  }

  List<Quotes> get quotes => _quotes;

  Future<void> fetch() async {
    // Fetch quotes data from the repository
    final quotes = await _repository.fetch();
    _quotes = quotes;
    notifyListeners();
  }
}
