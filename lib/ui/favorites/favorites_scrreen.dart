import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:cinebox/ui/favorites/favorite_view_model.dart';
import 'package:cinebox/ui/favorites/get_favorite_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScrreen extends ConsumerStatefulWidget {
  const FavoritesScrreen({super.key});

  @override
  ConsumerState<FavoritesScrreen> createState() => _FavoritesScrreenState();
}

class _FavoritesScrreenState extends ConsumerState<FavoritesScrreen>
    with LoaderAndMessage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoriteViewModelProvider).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoriteCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes Favoritos'),
      ),
      body: favoritesMovies.when(
        error: (error, stackTrace) => Center(
          child: Text('Erro as exibir filmes favoritos'),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text('Nenhum filmes cadastrado como favorito'),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final favorite = data[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: favorite.id,
                          title: favorite.title,
                          year: favorite.year,
                          imageUrl: favorite.posterPath,
                          isFavorite: true,
                          onFavoriteTap: () async {
                            showLoader();
                            await ref
                                .read(favoriteViewModelProvider)
                                .deleFavoriteMovie(favorite.id);
                            hideLoader();
                          },
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
