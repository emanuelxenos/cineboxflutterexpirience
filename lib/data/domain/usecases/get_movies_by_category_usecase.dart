import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox/data/domain/models/favorite_movie.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/domain/models/movies_by_category.dart';
import 'package:cinebox/data/repositories/movies/movies_reposittory.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesReposittory _moviesReposittory;

  GetMoviesByCategoryUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesReposittory moviesReposittory,
  }) : _tmdbRepository = tmdbRepository,
       _moviesReposittory = moviesReposittory;

  Future<Result<MoviesByCategory>> execute() async {
    final results = await Future.wait([
      _moviesReposittory.getMyFavoritesMovies(),
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getUpComingMovies(),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final upcoming),
    ]) {
      final favoritesIds = favorites.map((f) => f.id).toList();

      return Success(
        MoviesByCategory(
          popular: popular.markAsFavorite(favoritesIds),
          topRated: topRated.markAsFavorite(favoritesIds),
          nowPlaying: nowPlaying.markAsFavorite(favoritesIds),
          upcoming: upcoming.markAsFavorite(favoritesIds),
        ),
      );
    }

    return Failure(Exception('Erro ao buscar categorias de filmes'));
  }
}
