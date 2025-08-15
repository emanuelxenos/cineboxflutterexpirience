import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final moviesByGenreResult = await _tmdbRepository.getMoviesGenres(
      genreId: genreId,
    );
    return moviesByGenreResult;
  }
}
