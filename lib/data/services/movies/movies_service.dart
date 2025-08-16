import 'package:cinebox/data/domain/models/favorite_rmovie_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteRmovieResponse>> getMyFavoritesMovies();
}
