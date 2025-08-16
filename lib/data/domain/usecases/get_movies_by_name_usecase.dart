import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox/data/domain/models/favorite_movie.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/repositories/movies/movies_reposittory.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

class GetMoviesByNameUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesReposittory _moviesReposittory;

  GetMoviesByNameUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesReposittory moviesReposittory,
  }) : _tmdbRepository = tmdbRepository,
       _moviesReposittory = moviesReposittory;

  Future<Result<List<Movie>>> execute({required String name}) async {
    final results = await Future.wait([
      _moviesReposittory.getMyFavoritesMovies(),
      _tmdbRepository.searchMovies(query: name),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final movies),
    ]) {
      final favoritesIDs = favorites.map((f) => f.id).toList();
      return Success(movies.markAsFavorite(favoritesIDs));
    }
    return Failure(Exception('Erro oa buscar filmes por nome'));
  }
}
