import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_comand.g.dart';

@riverpod
class CheckUserLoggedComand extends _$CheckUserLoggedComand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = AsyncLoading();
    await Future.delayed(Duration(seconds: 2));
    state = AsyncData(false);
  }
}
