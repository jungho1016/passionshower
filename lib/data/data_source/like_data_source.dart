import 'package:passionshower/domain/model/quotes/quotes.dart';

class LikeDataSource {
  List<Quotes> likedQuotes = [];

  void likeQuote(Quotes quote) {
    likedQuotes.add(quote);
  }

  void unlikeQuote(Quotes quote) {
    likedQuotes.remove(quote);
  }
}
