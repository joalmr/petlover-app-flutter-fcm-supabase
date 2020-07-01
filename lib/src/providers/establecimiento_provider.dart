import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/models/establecimiento/lista_establecimiento_model.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class EstablecimientoProvider {
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  //List<int> filtros
  Future<List<EstablecimientoModel>> getVets(dynamic filtros) async {
    //String latlng
    print(_prefs.position.toString());
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    var filtroServicio;
    if (filtros.length > 0) {
      filtroServicio = filtros;
    } else {
      filtroServicio = "";
    }
    final url =
        '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';

    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    final jsonResp = json.decode(resp.body);
    EstablecimientoList vets = EstablecimientoList.fromJson(jsonResp);
    if (vets.establecimientos == null) return [];

    return vets.establecimientos;
  }

  Future<dynamic> getVet(String idVet) async {
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    final url = '$_url/establishments/$idVet?latitude=$lat&longitude=$lng';

    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    print(resp.statusCode);

    if (resp.statusCode == 200) {
      final jsonResp = json.decode(resp.body);
      EstablecimientoModel vets =
          EstablecimientoModel.fromJson(jsonResp["establishment"]);

      return {'status': 200, 'establishment': vets};
    } else {
      return {'status': 205, 'establishment': null};
    }
  }
}
