import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';


import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class EstablecimientoProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<List<EstablecimientoModel>> getVets() async {
    final url = '$_url/establishments';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final jsonResp = json.decode(resp.body);

    EstablecimientoList vets =  EstablecimientoList.fromJson(jsonResp);

    if(vets.establecimientos==null) return [];

    print(vets.establecimientos);
    return vets.establecimientos;
  }
}