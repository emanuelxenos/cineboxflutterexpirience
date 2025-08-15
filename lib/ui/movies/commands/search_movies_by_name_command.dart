import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/domain/models/movie.dart';
import 'package:cinebox/data/domain/usecases/usecases_providers.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByNameCommand extends _$SearchMoviesByNameCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(String name) async {
    final searchMovieUC = ref.read(getMoviesByNameUsecaseProvider);
    final result = await searchMovieUC.execute(name: name);

    state = switch (result) {
      Success(:final value) => AsyncData(value),

      Failure() => AsyncError(
        DataException(message: 'Erro ao buscar filme por nome'),
        StackTrace.current,
      ),
    };
  }
}
