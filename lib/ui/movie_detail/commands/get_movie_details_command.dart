import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_details_command.g.dart';

@riverpod
class GetMovieDetailsCommand extends _$GetMovieDetailsCommand {
  @override
  AsyncValue<MovieDetail> build() => AsyncLoading();

  Future<void> execute(int movieId) async {
    final result = await ref
        .read(tmdbRepositoryProvider)
        .getMovieDetail(movieId);
    state = switch (result) {
      Success(:final value) => AsyncData(value),

      Failure() => AsyncError('Erro ao buscar detalhes', StackTrace.current),
    };
  }
}
