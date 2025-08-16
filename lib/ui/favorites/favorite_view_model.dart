import 'package:cinebox/ui/favorites/get_favorite_command.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_view_model.g.dart';

class FavoriteViewModel {
  final GetFavoriteCommand _getFavoriteCommand;

  FavoriteViewModel({required GetFavoriteCommand getFavoriteCommand})
    : _getFavoriteCommand = getFavoriteCommand;

  Future<void> fetchFavorites() => _getFavoriteCommand.execute();
}

@riverpod
FavoriteViewModel favoriteViewModel(Ref ref) => FavoriteViewModel(
  getFavoriteCommand: ref.read(getFavoriteCommandProvider.notifier),
);
