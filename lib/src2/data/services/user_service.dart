import 'package:proypet/src/models/login/user_model.dart';
import 'package:proypet/src2/data/models/update/usuario/user_model.dart';
import 'package:proypet/src2/data/providers/user_provider.dart';

class UserService {
  final UserProvider userProvider = UserProvider();

  Future<UserModel2> getUser() {
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
