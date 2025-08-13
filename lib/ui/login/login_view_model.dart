import 'package:cinebox/ui/login/commands/login_wiith_google_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

class LoginViewModel {
  final LoginWiithGoogleCommand _loginWiithGoogleCommand;

  LoginViewModel({required LoginWiithGoogleCommand loginWiithGoogleCommand})
    : _loginWiithGoogleCommand = loginWiithGoogleCommand;

  void googleLogin() => _loginWiithGoogleCommand.execute();
}

@riverpod
LoginViewModel loginViewModel(Ref ref) {
  return LoginViewModel(
    loginWiithGoogleCommand: ref.watch(
      loginWiithGoogleCommandProvider.notifier,
    ),
  );
}
