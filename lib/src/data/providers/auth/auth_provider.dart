import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/components/snackbar.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/auth_controller/services/facebook_sing.dart';
import 'package:proypet/src/controllers/auth_controller/services/google_sign.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class AuthProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  Dio dio = new Dio();

  Future<int> loginGoogle(
    String name,
    String lastname,
    String email,
    String fbId,
    String accessToken,
  ) async {
    final url = '$_url/login/google';

    try {
      final loginData = {
        "first_name": name,
        "last_name": lastname,
        "email": email,
        "social_id": fbId,
        "access_token": accessToken
      };

      print("==try google==");

      Response response;
      response = await dio.post(url, data: loginData);

      print("==login google==");
      print(response.statusCode);

      if (response.statusCode == 200) {
        _prefs.token = response.data['token'];
        _prefs.verify = response.data['verify'];
      }

      return response.statusCode;
    } catch (ex) {
      print("==catch google==");
      print(ex);
      return 500;
    }
  }

  Future<int> loginFb(
    String name,
    String lastname,
    String email,
    String fbId,
    String accessToken,
  ) async {
    final url = '$_url/login/facebook';

    try {
      final loginData = {
        "first_name": name,
        "last_name": lastname,
        "email": email,
        "social_id": fbId,
        "access_token": accessToken
      };

      print("==try fb==");

      Response response;
      response = await dio.post(url, data: loginData);

      print("==login fb==");
      print(response.statusCode);

      if (response.statusCode == 200) {
        _prefs.token = response.data['token'];
        _prefs.verify = response.data['verify'];
      }
      // else if (response.statusCode == 401) return response.statusCode;
      return response.statusCode;
    } catch (ex) {
      print("==catch fb==");
      print(ex);
      return 500;
    }
  }

  Future<Map<String, dynamic>> loginToken(String email, String password) async {
    final url = '$_url/login';
    try {
      final loginData = {"email": email, "password": password};
      Response response;
      response = await dio.post(url, data: loginData);

      var jsonRespuesta;

      if (response.statusCode == 200) {
        _prefs.token = response.data['token'];
        _prefs.verify = response.data['verify'];
      }
      jsonRespuesta = {
        'code': response.statusCode,
        'token': response.data['token']
      };
      return jsonRespuesta;
    } catch (ex) {
      return {'code': 500, 'message': 'Error de servidor, inténtelo más tarde'};
    }
  }

  Future<void> sendTokenFire(String fireToken) async {
    final url = '$_url/firebase';
    final fireData = {"token": fireToken};

    try {
      await dio.post(
        url,
        data: fireData,
        options: Options(
          headers: headersToken(),
        ),
      );
    } on DioError catch (ex) {
      mostrarSnackbar("Error de servidor", colorRed);
      Timer(Duration(milliseconds: 1500), () => _outToken());
      throw Exception(ex.message);
    }
  }

  void _outToken() async {
    FacebookSignInService.signOut();
    GoogleSignInService.signOut();
    logOut();
    _prefs.tokenDel(); //limpia token
    _prefs.verifyDel(); //limpia verificado
    _prefs.positionDel(); //limpia gps para lista vets
    _prefs.ubicacionDel(); //limpia direccion para lista vets
    _prefs.myAddressDel(); //limpia direccion de la ultima reserva realizada
    _prefs.myAddressLatLngDel(); //limpia gps de la ultima reserva realizada
    _prefs.notificaAvisoDel(); //limpia notificacion aviso

    Get.offAllNamed('login');
  }

  Future<void> logOut() async {
    final url = '$_url/logout';
    await dio.post(url, options: Options(headers: headersToken()));
  }

  Future<int> forgotPassword(String email) async {
    final url = '$_url/password/reset';

    final emailData = {"email": email};
    Response response;
    response = await dio.post(url, data: emailData);
    return response.statusCode;
  }

  Future<int> registerUser(
      String name, String lastname, String email, String password) async {
    final url = '$_url/register';
    try {
      final userData = {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password
      };
      Response response;
      response = await dio.post(url, data: userData);

      return response.statusCode;
    } catch (ex) {
      return 0;
    }
  }
}
