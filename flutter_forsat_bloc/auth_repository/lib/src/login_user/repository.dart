import 'package:auth_repository/index.dart';
import 'package:auth_repository/src/login_user/login_api.dart';

class LoginUserRepository implements AuthRepository {

  LoginUserApi loginUserProvider = LoginUserApi();

  Future<bool> isAuthenticated() async {
    return false;
  }

  Future<void> authenticate() {
    return null;
  }

  Future<void> unAuthenticate() async {
    return null;
  }
  Future<AuthAccessToken> userLogin({String email, String password}) async {
    final userReq = await loginUserProvider.userLogin(email, password);
    return userReq;
  }
}
