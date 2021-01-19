import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:proypet/src/data/providers/user/model/user_model.dart';

class UserProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  Future<UserModel2> getUser() async {
    final url = '$_url/profile';

    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );
    final datosUsuario = UserModel2.fromJson(response.data['user']);

    return datosUsuario;
  }

  Future<bool> editUser(String nombre, String apellido, String telefono) async {
    final url = '$_url/profile';
    final userData = {"name": nombre, "lastname": apellido, "phone": telefono};
    final resp = await http.post(url, body: userData, headers: headersToken());

    if (resp.statusCode == 200 || resp.statusCode == 201)
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
    final resp =
        await http.post(url, headers: headersToken(), body: changePass);
    return resp.statusCode;
  }
}
