import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:proypet/src/model/login/login_model.dart';
import 'package:proypet/src/model/login/token_model.dart';
import 'package:proypet/src/model/usuario_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';


class LoginProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> loginToken(LoginModel login) async {
    final url = '$_url/login';   

    try{
      final loginData = { "email": login.email, "password": login.password };

      final resp = await http.post(url, body: loginData );
      
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      
      //final respToken = TokenModel.fromJson(decodedResp);
      //print(respToken.token);

      if(decodedResp.containsKey('token')){
        _prefs.token = decodedResp['token'];

        getUser();

        return {
          'ok':true,
          'token':decodedResp['token']
        };
      } else{
        return{
          'ok':false,
          'mensaje':'Usuario o clave incorrecta'
        };
      }
    }
    catch(ex){
      return{
          'ok':false,
          'mensaje':'Usuario o clave incorrecta'
        };
    }
  }

  Future<User> getUser() async {
    final url = '$_url/profile';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosUsuario = usuarioModelFromJson(resp.body);
    //print(datosUsuario.user.name);

    return datosUsuario.user;
  }
}
  