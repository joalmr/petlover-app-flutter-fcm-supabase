import 'package:proypet/src2/data/models/update/usuario/user_model.dart';
import 'package:proypet/src2/data/providers/user_provider.dart';

class UserService {
  final UserProvider userProvider = UserProvider();

  Future<UserModel2> getUser() {
    return userProvider.getUser();
  }

  editUser(String nombre, String apellido, String telefono) {
    return userProvider.editUser(nombre, apellido, telefono);
  }

  // validaTelefono() {
  //   return userProvider.validaTelefono();
  // }

  changePassword(String passAntigua, String passNueva) {
    return userProvider.changePassword(passAntigua, passNueva);
  }
}
