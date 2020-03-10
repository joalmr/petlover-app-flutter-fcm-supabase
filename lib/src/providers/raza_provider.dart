import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/src/model/raza/raza_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class RazaProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<List<RazaModel>> getBreed(String idRaza) async {
    final url = '$_url/breeds/?specie=$idRaza';

    try {
      final resp = await http.get(url,
        headers: { 
          HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
        }
      );

      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      print(decodedResp['breeds']);
      final datosRaza = decodedResp['breeds'];

      final List<RazaModel> razas = new List();

      if(datosRaza==null) return [];

      datosRaza.forEach((pet){
        final petTemp = RazaModel.fromJson(pet);
        razas.add(petTemp);
      });

      // print(razas);

      return razas;

    }

    catch(ex) {
      return [];
    }

  }
  
}