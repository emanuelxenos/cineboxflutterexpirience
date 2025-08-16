import 'package:cinebox/data/repositories/auth/auth_repository.dart';
import 'package:cinebox/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox/data/repositories/movies/movies_reposittory.dart';
import 'package:cinebox/data/repositories/movies/movies_reposittory_impl.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository_impl.dart';
import 'package:cinebox/data/services/services_provider.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSigninService: ref.read(googleSigninServiceProvider),
    authService: ref.read(authServiceProvider),
  );
}

@riverpod
TmdbRepository tmdbRepository(Ref ref) {
  return TmdbRepositoryImpl(tmdbService: ref.read(tmdbServiceProvider));
}

@riverpod
MoviesReposittory moviesReposittory(Ref ref) =>
    MoviesReposittoryImpl(moviesService: ref.read(moviesServiceProvider));
