import 'package:proypet/src/models/login/user_model.dart';
import 'package:proypet/src2/data/providers/user_provider.dart';

class UserService {
  // LoginService({ this.loginProvider}) : assert(loginProvider != null);
  final UserProvider userProvider = UserProvider();

  getUser() {
    return userProvider.getUser();
  }

  editUser(User user) {
    return userProvider.editUser(user);
  }

  validaTelefono() {
    return userProvider.validaTelefono();
  }

  changePassword(String passAntigua, String passNueva) {
    return userProvider.changePassword(passAntigua, passNueva);
  }
}
