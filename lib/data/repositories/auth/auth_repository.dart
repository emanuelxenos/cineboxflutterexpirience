import 'package:cinebox/core/result/result.dart';

abstract interface class AuthRepository {
  Future<Result<Unit>> singIn();
  Future<Result<Unit>> singOut();
  Future<Result<bool>> isLogged();
}
