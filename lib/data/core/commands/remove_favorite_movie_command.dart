import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/core/commands/favorite_movie_command.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_favorite_movie_command.g.dart';

@riverpod
class RemoveFavoriteMovieCommand extends _$RemoveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute() async {
    final favoriteMovieCommand = ref.read(
      favoriteMovieCommandProvider(movieId).notifier,
    )..setFavorite(false);

    final repo = ref.read(moviesReposittoryProvider);
    final result = await repo.deleteFavoriteMovie(movieId);

    switch (result) {
      case Success():
        log('Faavorito $movieId removido com sucesso');
      case Failure(:final error):
        favoriteMovieCommand.setFavorite(true);
        state = AsyncError(error, StackTrace.current);
    }
  }
}
