import 'package:cinebox/data/repositories/movies/movies_reposittory.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/ui/favorites/get_favorite_command.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_view_model.g.dart';

class FavoriteViewModel {
  final GetFavoriteCommand _getFavoriteCommand;
  final MoviesReposittory _moviesReposittory;

  FavoriteViewModel({
    required GetFavoriteCommand getFavoriteCommand,
    required MoviesReposittory moviesReposittory,
  }) : _getFavoriteCommand = getFavoriteCommand,
       _moviesReposittory = moviesReposittory;

  Future<void> fetchFavorites() => _getFavoriteCommand.execute();

  Future<void> deleFavoriteMovie(int movieId) async {
    await _moviesReposittory.deleteFavoriteMovie(movieId);
    fetchFavorites();
  }
}

@riverpod
FavoriteViewModel favoriteViewModel(Ref ref) => FavoriteViewModel(
  getFavoriteCommand: ref.read(getFavoriteCommandProvider.notifier),
  moviesReposittory: ref.read(moviesReposittoryProvider),
);
