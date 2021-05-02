import 'package:proypet/source/auth/data/provider/auth_provider.dart';

class AuthService {
  // LoginService({ this.loginProvider}) : assert(loginProvider != null);
  final AuthProvider loginProvider = AuthProvider();

  Future<int> loginGoogle(
    String name,
    String lastname,
    String email,
    String fbId,
    String accessToken,
  ) {
    return loginProvider.loginGoogle(name, lastname, email, fbId, accessToken);
  }

  Future<int> loginFb(
    String name,
    String lastname,
    String email,
    String fbId,
    String accessToken,
  ) {
    return loginProvider.loginFb(name, lastname, email, fbId, accessToken);
  }

  login(String email, String password) {
    return loginProvider.loginToken(email, password);
  }

  sendTokenFire(String fireToken) {
    return loginProvider.sendTokenFire(fireToken);
  }

  forgot(String email) {
    return loginProvider.forgotPassword(email);
  }

  registerUser(String name, String lastname, String email, String password) {
    return loginProvider.registerUser(name, lastname, email, password);
  }

  logOut() {
    return loginProvider.logOut();
  }

  outToken() {
    return loginProvider.outToken();
  }
}
