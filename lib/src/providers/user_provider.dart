import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/home_model.dart';
import 'package:proypet/src/model/login/login_model.dart';
import 'dart:convert';
import 'package:proypet/src/model/login/user_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';


class UserProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> loginToken(UserDato login) async {
    final url = '$_url/login';   

    try{
      final loginData = { "email": login.email, "password": login.password };
      final resp = await http.post(url, body: loginData );
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      
      if(decodedResp.containsKey('token')){
        _prefs.token = decodedResp['token'];

        return {
          'ok':true,
          'verify':decodedResp['verify'],
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

  Future<bool> forgotPassword(String email) async{
    final url = '$_url/password/reset';

    final emailData = { "email": email };
    final resp = await http.post(url, body: emailData );
    if(resp.statusCode==200) return true;
    else return false;
  }
  //summary
  Future<HomeModel> getUserSummary() async {
    final url = '$_url/summary';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosUsuario = homeModelFromJson(resp.body);

    return datosUsuario;
  }

  Future<bool> registerUser(UserDato user) async {
    final url = '$_url/register';
    final userData = { 
      "name": user.name, 
      "lastname": user.lastname, 
      "email": user.email, 
      "password": user.password
    };
    final resp = await http.post(url, body: userData );
    
    if(resp.statusCode==200 || resp.statusCode==201) return true;
    else return false;
  }

  Future<UserModel> getUser() async {
    final url = '$_url/profile';
    final resp = await http.get(url, headers: { 
      HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
    });
    
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
    final resp = await http.post(url, body: userData, headers: { 
      HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
    });
    
    if(resp.statusCode==200 || resp.statusCode==201) return true;
    else return false;
  }

  Future<bool> validaTelefono() async {
    final url = '$_url/profile';
    final resp = await http.get(url, headers: { 
      HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
    });
    
    final datosUsuario = userModelFromJson(resp.body);
    
    if(datosUsuario.user.phone != null) return true;
    else return false;
  }

}
  