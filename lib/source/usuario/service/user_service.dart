import 'package:proypet/source/usuario/model/user_model.dart';
import 'package:proypet/source/usuario/provider/user_provider.dart';

class UserService {
  final UserProvider userProvider = UserProvider();

  Future<UserModel2> getUser() {
    return userProvider.getUser();
  }

  editUser(String nombre, String apellido, String telefono) {
    return userProvider.editUser(nombre, apellido, telefono);
  }

  changePassword(String passAntigua, String passNueva) {
    return userProvider.changePassword(passAntigua, passNueva);
  }
}
