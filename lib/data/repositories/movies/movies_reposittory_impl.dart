import 'dart:developer';

import 'package:cinebox/core/result/result.dart';

import 'package:cinebox/data/domain/models/favorite_movie.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/models/save_favorite_movie.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:dio/dio.dart';

import './movies_reposittory.dart';

class MoviesReposittoryImpl implements MoviesReposittory {
  final MoviesService _moviesService;

  MoviesReposittoryImpl({required MoviesService moviesService})
    : _moviesService = moviesService;

  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovie(
              id: f.id,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();

      return Success(favorites);
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes favoritos', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar filmes favoritos'));
    }
  }

  @override
  Future<Result<Unit>> deleteFavoriteMovie(int movieId) async {
    try {
      await _moviesService.deleteFavoriteMovie(movieId);
      return successOfUnit();
    } on DioException catch (e, s) {
      log('Erro ao deletaar favorito', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao deletar favorito'));
    }
  }

  @override
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie) async {
    try {
      await _moviesService.saveFavoriteMovie(
        SaveFavoriteMovie(
          id: favoriteMovie.id,
          postterUrl: favoriteMovie.posterPath,
          title: favoriteMovie.title,
          year: favoriteMovie.year,
        ),
      );
      return successOfUnit();
    } on DioException catch (e, s) {
      log('Erro ao salvar favorito ', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao salvar favorite'));
    }
  }
}
