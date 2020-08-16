import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/login/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final _url = urlApi;

  Future<UserModel> getUser() async {
    final url = '$_url/profile';
    final resp = await http.get(url, headers: headersToken());

    final datosUsuario = userModelFromJson(resp.body);

    return datosUsuario;
  }

  Future<bool> editUser(User user) async {
    final url = '$_url/profile';
    final userData = {"name": user.name, "lastname": user.lastname, "phone": user.phone};
    final resp = await http.post(url, body: userData, headers: headersToken());

    if (resp.statusCode == 200 || resp.statusCode == 201)
      return true;
    else
      return false;
  }

  Future<bool> validaTelefono() async {
    final url = '$_url/profile';
    final resp = await http.get(url, headers: headersToken());

    final datosUsuario = userModelFromJson(resp.body);

    if (datosUsuario.user.phone != null)
      return true;
    else
      return false;
  }

  Future<int> changePassword(String passAntigua, String passNueva) async {
    final url = '$_url/settings/password';

    final changePass = {
      "current_password": passAntigua,
      "password": passNueva,
      "password_confirmation": passNueva,
    };
    final resp = await http.post(url, headers: headersToken(), body: changePass);
    return resp.statusCode;
  }
}
