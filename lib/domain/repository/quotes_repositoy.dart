import 'package:passionshower/domain/model/quotes/quotes.dart';

abstract interface class QuotesRepository {
  Future<List<Quotes>> fetch();
}
