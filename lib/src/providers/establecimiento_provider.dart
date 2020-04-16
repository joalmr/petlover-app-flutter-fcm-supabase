import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class EstablecimientoProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  //List<int> filtros
  Future<List<EstablecimientoModel>> getVets(dynamic filtros) async {
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    var filtroServicio;
    if(filtros.length>0){
      filtroServicio=filtros;
    }
    else{
      filtroServicio="";
    }
    final url = '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}"
      }
    );

    final jsonResp = json.decode(resp.body);
    EstablecimientoList vets =  EstablecimientoList.fromJson(jsonResp);
    if(vets.establecimientos==null) return [];
    
    return vets.establecimientos;
  }

  Future<EstablecimientoModel> getVet(String idVet) async {
    final url = '$_url/establishments/$idVet';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final jsonResp = json.decode(resp.body);
    EstablecimientoModel vets =  EstablecimientoModel.fromJson(jsonResp["establishment"]);
    return vets;
  }
}