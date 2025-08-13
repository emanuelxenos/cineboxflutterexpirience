import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_wiith_google_command.g.dart';

@riverpod
class LoginWiithGoogleCommand extends _$LoginWiithGoogleCommand {
  @override
  AsyncValue<void> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.singIn();
    switch (result) {
      case Success<Unit>():
        state = AsyncData(null);
      case Failure<Unit>():
        state = AsyncError(
          'Erro ao realizer login, conate o suporte.',
          StackTrace.current,
        );
    }
  }
}
