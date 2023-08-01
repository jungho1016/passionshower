import 'package:passionshower/domain/model/quotes/quotes.dart';

abstract interface class LikeRepository {
  void likeQuote(Quotes quote);

  void unlikeQuote(Quotes quote);

  Future<void> likeSave();

  Future<void> likeLoad();

  List<Quotes> get likedQuotes;
}
