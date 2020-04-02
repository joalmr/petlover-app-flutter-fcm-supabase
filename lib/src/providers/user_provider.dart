import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/home_model.dart';
import 'dart:convert';
import 'package:proypet/src/model/login/user_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';


class UserProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> loginToken(UserModel login) async {
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

  //summary
  Future<HomeModel> getUser() async {
    final url = '$_url/summary';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosUsuario = homeModelFromJson(resp.body);

    return datosUsuario;
  }

  Future<bool> registerUser(UserModel user) async {
    final url = '$_url/register';
    final userData = { 
      "name": user.name, 
      "lastname": user.lastname, 
      "email": user.email, 
      "password": user.password
    };
    final resp = await http.post(url, body: userData );
    // print(resp.statusCode);
    if(resp.statusCode==201) return true;
    else return false;
  }
}
  