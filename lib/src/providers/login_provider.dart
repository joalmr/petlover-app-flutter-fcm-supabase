import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/src/model/home_model.dart';
import 'dart:convert';
import 'package:proypet/src/model/login/login_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';


class LoginProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> loginToken(LoginModel login) async {
    //http://ce2019121721001.dnssw.net/api/login
    final url = '$_url/login';   

    try{
      final loginData = { "email": login.email, "password": login.password };

      final resp = await http.post(url, body: loginData );
      
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      
      if(decodedResp.containsKey('token')){
        _prefs.token = decodedResp['token'];

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

  Future<HomeModel> getUser() async {
    //http://ce2019121721001.dnssw.net/api/summary
    final url = '$_url/summary';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosUsuario = homeModelFromJson(resp.body);

    return datosUsuario;
  }
}
  