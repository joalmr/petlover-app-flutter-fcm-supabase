import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/models/home_model.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'dart:convert';
import 'package:proypet/src/models/login/user_model.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class UserProvider {
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> loginToken(UserDato login) async {
    final url = '$_url/login';

    try {
      final loginData = {"email": login.email, "password": login.password};
      final resp = await http.post(url, body: loginData);

      final Map<String, dynamic> decodedResp = json.decode(resp.body);

      var jsonRespuesta;

      if (resp.statusCode == 200) {
        _prefs.token = decodedResp['token'];
        jsonRespuesta = {'code': 200, 'token': decodedResp['token']};
      } else if (resp.statusCode == 401) {
        jsonRespuesta = {'code': 401, 'message': decodedResp['message']};
      }
      return jsonRespuesta;
      // final Map<String, dynamic> decodedResp = json.decode(resp.body);

      // if (decodedResp.containsKey('token')) {
      //   _prefs.token = decodedResp['token'];
      //   // print(_prefs.token);
      //   return {
      //     'ok': true,
      //     'verify': decodedResp['verify'],
      //     'token': decodedResp['token']
      //   };
      // } else {
      //   return {'ok': false, 'mensaje': 'Usuario o clave incorrecta'};
      // }
    } catch (ex) {
      return {'ok': false, 'mensaje': 'Usuario o clave incorrecta'};
    }
  }

  Future<void> sendTokenFire(String fireToken) async {
    final url = '$_url/firebase';
    final fireData = {"token": fireToken};
    var resp = await http.post(url, headers: headersToken(), body: fireData);
    print('===== guarda firebase =====');
    print(resp.statusCode);
  }

  Future<void> logOut() async {
    final url = '$_url/logout';
    var resp = await http.post(
      url,
      headers: headersToken(),
    );
    print(resp.statusCode);
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
    // print(resp.statusCode);
    return resp.statusCode;
  }

  Future<int> forgotPassword(String email) async {
    final url = '$_url/password/reset';

    final emailData = {"email": email};
    final resp = await http.post(url, body: emailData);
    return resp.statusCode;
  }

  // bool validateMain() {
  //   var valor;
  //   getUserSummary().then((dato)=>
  //     valor = dato
  //   );

  //   // if(valor==null){
  //   //   return false;
  //   // }
  //   // else{
  //   //   return true;
  //   // }
  // }

  //summary
  Future<HomeModel> getUserSummary() async {
    final url = '$_url/summary';
    // print(_prefs.token);
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    HomeModel homeModel = homeModelFromJson(resp.body);
    return homeModel;
  }

  Future<bool> registerUser(UserDato user) async {
    final url = '$_url/register';
    final userData = {
      "name": user.name,
      "lastname": user.lastname,
      "email": user.email,
      "password": user.password
    };
    final resp = await http.post(url, body: userData);

    if (resp.statusCode == 200 || resp.statusCode == 201)
      return true;
    else
      return false;
  }

  Future<UserModel> getUser() async {
    final url = '$_url/profile';
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    final datosUsuario = userModelFromJson(resp.body);

    return datosUsuario;
  }

  Future<bool> editUser(User user) async {
    final url = '$_url/profile';
    final userData = {
      "name": user.name,
      "lastname": user.lastname,
      "phone": user.phone
    };
    final resp = await http.post(
      url,
      body: userData,
      headers: headersToken(),
    );

    if (resp.statusCode == 200 || resp.statusCode == 201)
      return true;
    else
      return false;
  }

  Future<bool> validaTelefono() async {
    final url = '$_url/profile';
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    final datosUsuario = userModelFromJson(resp.body);

    if (datosUsuario.user.phone != null)
      return true;
    else
      return false;
  }
}
