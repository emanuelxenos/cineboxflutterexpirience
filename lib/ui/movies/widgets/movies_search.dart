import 'package:cinebox/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesSearch extends ConsumerStatefulWidget {
  const MoviesSearch({super.key});

  @override
  ConsumerState<MoviesSearch> createState() => _MoviesSearchState();
}

class _MoviesSearchState extends ConsumerState<MoviesSearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(searchMoviesByNameCommandProvider);
    return moviesResult.when(
      data: (data) {
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes Encontrados Pela busca',
            vertical: true,
            movies: data,
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Erro budcar filmes'),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
