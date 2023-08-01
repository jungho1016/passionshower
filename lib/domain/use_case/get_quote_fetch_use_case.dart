import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/quotes_repositoy.dart';

class GetQuotefetchUseCase {
  final QuotesRepository _repository;

  GetQuotefetchUseCase(this._repository);

  // Future<List<Quotes>> fetch() async {
  //   final quotes = await _repository.fetch();
  //   _quotes = quotes;
  //
  //   return
  // }
}
