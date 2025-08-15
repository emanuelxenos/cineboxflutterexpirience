import 'package:cinebox/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerWidget {
  const MoviesByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      loading: () => Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Center(
          child: Text('Erro ao buscar filmes'),
        ),
      ),
      data: (data) {
        if (data == null) {
          return Center(
            child: Text('Nenhum filme encontrado'),
          );
        }
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: Column(
            children: [
              MoviesBox(
                title: 'Mais populares',
                movies: data.popular,
              ),
              MoviesBox(
                title: 'Top filmes',
                movies: data.topRated,
              ),
              MoviesBox(
                title: 'Em cartaz',
                movies: data.nowPlaying,
              ),
              MoviesBox(
                title: 'Em breve',
                movies: data.upcoming,
              ),
            ],
          ),
        );
      },
    );
  }
}
