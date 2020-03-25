import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/raza/raza_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class RazaProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<RazaModel> getBreed(String idRaza) async {
    final url = '$_url/breeds/?specie=$idRaza';
    
    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final razaModel = razaModelFromJson(resp.body);
    return razaModel;
  }
}