import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(movieData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieData = await _tmdbService.getNowPlaingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(movieData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieData = await _tmdbService.getTopRagedMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(movieData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(movieData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }
}
