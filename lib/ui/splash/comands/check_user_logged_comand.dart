import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_comand.g.dart';

@riverpod
class CheckUserLoggedComand extends _$CheckUserLoggedComand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    final isLoggedResult = await authRepository.isLogged();

    state = switch (isLoggedResult) {
      Success(value: final isLogged) => AsyncData(isLogged),
      Failure(:final error) => AsyncError(error, StackTrace.current),
    };
  }
}
