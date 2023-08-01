import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

class GetRandomQuoteUseCase {
  final QuotesRepository _repository;
  List<Quotes> _usedQuotes = [];

  GetRandomQuoteUseCase(this._repository);

  Future<Quotes> getRandomQuoteUseCase() async {
    final List<Quotes> quotes = await _repository.fetch();
    quotes.shuffle();

    for (final quote in quotes) {
      if (!_usedQuotes.contains(quote)) {
        _usedQuotes.add(quote);
        return quote;
      }
    }

    // 모든 명언을 사용한 경우, _usedQuotes 리스트를 초기화합니다.
    _usedQuotes.clear();

    // 새로운 명언 리스트로 다시 시도합니다.
    return getRandomQuoteUseCase();
  }
}
