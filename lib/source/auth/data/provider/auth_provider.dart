import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:proypet/config/variables_globales.dart';
import 'package:proypet/source/auth/data/service/facebook_sing.dart';
import 'package:proypet/source/auth/data/service/google_sign.dart';
import 'package:proypet/utils/error.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  final _url = urlApi;

  Future<int> loginToken(String email, String password) async {
    final url = Uri.parse('$_url/login');
    try {
      final loginData = {"email": email, "password": password};
      final response = await http.post(url, body: loginData);

      if (response.statusCode == 200) {
        final jsonResp = json.decode(response.body);
        prefUser.token = jsonResp['token'];
        prefUser.verify = jsonResp['verify'];
      }
      return response.statusCode;
    } catch (ex) {
      return 500;
    }
  }

  Future<int> loginGoogle(
    String name,
    String lastname,
    String email,
    String fbId,
    String accessToken,
  ) async {
    final url = Uri.parse('$_url/login/google');

    try {
      final loginData = {
        "first_name": name,
        "last_name": lastname,
        "email": email,
        "social_id": fbId,
        "access_token": accessToken
      };

      final response = await http.post(url, body: loginData);

      if (response.statusCode == 200) {
        final jsonResp = json.decode(response.body);
        prefUser.token = jsonResp['token'];
        prefUser.verify = jsonResp['verify'];
      }

      return response.statusCode;
    } catch (ex) {
      return 500;
    }
  }

  Future<int> loginFb(String name, String lastname, String email, String fbId,
      String accessToken) async {
    final url = Uri.parse('$_url/login/facebook');

    try {
      final loginData = {
        "first_name": name,
        "last_name": lastname,
        "email": email,
        "social_id": fbId,
        "access_token": accessToken
      };

      final response = await http.post(url, body: loginData);

      if (response.statusCode == 200) {
        final jsonResp = json.decode(response.body);
        prefUser.token = jsonResp['token'];
        prefUser.verify = jsonResp['verify'];
      }
      return response.statusCode;
    } catch (ex) {
      return 500;
    }
  }

  Future<void> sendTokenFire(String fireToken) async {
    final url = Uri.parse('$_url/firebase');
    final fireData = {"token": fireToken};
    try {
      await http.post(
        url,
        headers: headersToken(),
        body: fireData,
      );
    } catch (ex) {
      errorInesperado();
      throw Exception(ex.message);
    }
  }

  Future<int> forgotPassword(String email) async {
    final url = Uri.parse('$_url/password/reset');
    final emailData = {"email": email};
    final response = await http.post(url, body: emailData);
    return response.statusCode;
  }

  Future<int> registerUser(
      String name, String lastname, String email, String password) async {
    final url = Uri.parse('$_url/register');
    try {
      final userData = {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password
      };
      final response = await http.post(url, body: userData);

      return response.statusCode;
    } catch (ex) {
      return 0;
    }
  }

  Future<void> logOut() async {
    final url = Uri.parse('$_url/logout');
    await http.post(url, headers: headersToken());
  }

  void outToken() async {
    FacebookSignInService.signOut();
    GoogleSignInService.signOut();
    logOut();
    prefUser.tokenDel(); //limpia token
    prefUser.verifyDel(); //limpia verificado
    prefUser.positionDel(); //limpia gps para lista vets
    prefUser.ubicacionDel(); //limpia direccion para lista vets
    prefUser.myAddressDel(); //limpia direccion de la ultima reserva realizada
    prefUser.myAddressLatLngDel(); //limpia gps de la ultima reserva realizada
    // prefUser.notificaAvisoDel(); //limpia notificacion aviso

    Get.offAllNamed('login');
  }
}
