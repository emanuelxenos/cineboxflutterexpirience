import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/models/favorite_movie.dart';

abstract interface class MoviesReposittory {
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
  Future<Result<Unit>> deleteFavoriteMovie(int movieId);
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}
