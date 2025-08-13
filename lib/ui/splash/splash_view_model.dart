import 'package:cinebox/ui/splash/comands/check_user_logged_comand.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

class SplashViewModel {
  final CheckUserLoggedComand _checkUserLoggedComand;

  SplashViewModel({required CheckUserLoggedComand checkUserLoggedCommand})
    : _checkUserLoggedComand = checkUserLoggedCommand;

  void checkLoginAndRedirect() {
    _checkUserLoggedComand.execute();
  }
}

@riverpod
SplashViewModel splashViewModel(Ref ref) {
  return SplashViewModel(
    checkUserLoggedCommand: ref.read(checkUserLoggedComandProvider.notifier),
  );
}
