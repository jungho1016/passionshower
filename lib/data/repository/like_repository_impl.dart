import 'package:injectable/injectable.dart';
import 'package:passionshower/data/data_source/like_data_source.dart';
import 'package:passionshower/domain/model/quotes/quotes.dart';
import 'package:passionshower/domain/repository/like_repositoy.dart';

@Singleton(as: LikeRepository)
class LikeRepositoryimpl implements LikeRepository {
  final LikeDataSource _likeDataSource;
  @override
  List<Quotes> get likedQuotes => _likeDataSource.likedQuotes;

  LikeRepositoryimpl(this._likeDataSource);

  @override
  void likeQuote(Quotes quote) {
    _likeDataSource.likeQuote(quote);
  }

  @override
  void unlikeQuote(Quotes quote) {
    _likeDataSource.unlikeQuote(quote);
  }

  @override
  Future<void> likeSave() async {
    await _likeDataSource.likeSave();
  }

  @override
  Future<void> likeLoad() async {
    await _likeDataSource.likeLoad();
  }
}
