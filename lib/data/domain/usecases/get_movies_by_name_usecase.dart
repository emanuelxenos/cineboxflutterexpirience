import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

class GetMoviesByNameUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByNameUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required String name}) async {
    final moviesByGenreResult = await _tmdbRepository.searchMovies(
      query: name,
    );
    return moviesByGenreResult;
  }
}
