import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/models/movie_response.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => Movie(
            id: response.id,
            title: response.title,
            overview: response.overview,
            genreIds: response.genreIds ?? [],
            votAverage: response.voteAverage,
            posterPath: response.posterPath,
            backdropPath: response.backdroPath,
            releaseDate: response.releaseDate,
          ),
        )
        .toList();
  }
}
