import 'package:injectable/injectable.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

@singleton
class GetRandomQuoteUseCase {
  final QuotesRepository _repository;
  final List<Quotes> _usedQuotes = [];

  GetRandomQuoteUseCase(this._repository);

  Future<List<Quotes>> excute() async {
    final List<Quotes> quotes = await _repository.fetch();
    quotes.shuffle();

    List<Quotes> unusedQuotes = [];
    for (final quote in quotes) {
      if (!_usedQuotes.contains(quote)) {
        unusedQuotes.add(quote);
      }
    }

    if (unusedQuotes.isEmpty) {
      // All quotes have been used, so clear the used quotes list.
      _usedQuotes.clear();

      // Try again with a new list of quotes.
      return excute();
    }

    _usedQuotes.addAll(unusedQuotes);
    return unusedQuotes;
  }
}
