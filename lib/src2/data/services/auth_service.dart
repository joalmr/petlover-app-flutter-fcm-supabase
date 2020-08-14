import 'package:proypet/src2/data/providers/auth_provider.dart';

class AuthService {
  // LoginService({ this.loginProvider}) : assert(loginProvider != null);
  final AuthProvider loginProvider = AuthProvider();

  login(String email, String password) {
    return loginProvider.loginToken(email, password);
  }

  logOut() {
    return loginProvider.logOut();
  }

  sendTokenFire(String fireToken) {
    return loginProvider.sendTokenFire(fireToken);
  }

  //
  forgot(String email) {
    return loginProvider.forgotPassword(email);
  }

  registerUser(String name, String lastname, String email, String password) {
    return loginProvider.registerUser(name, lastname, email, password);
  }
}
