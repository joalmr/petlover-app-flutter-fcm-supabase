import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/establecimiento/comentarios_model.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/models/establecimiento/lista_establecimiento_model.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';

class EstablecimientoProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  //List<int> filtros
  Future<dynamic> getVets(dynamic filtros) async {
    // print('=== gps ===');
    // print(_prefs.position.toString());

    int estado = 200;
    List<EstablecimientoModel> establecimientos = [];

    if (_prefs.position == null || _prefs.position.trim() == "") {
      estado = 211; //no tiene ubicacion
    }

    if (estado == 200) {
      String lat = _prefs.position.split(',')[0];
      String lng = _prefs.position.split(',')[1];

      var filtroServicio;
      if (filtros.length > 0) {
        filtroServicio = filtros;
      } else {
        filtroServicio = "";
      }
      final url = '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';

      final resp = await http.get(
        url,
        headers: headersToken(),
      );

      final jsonResp = json.decode(resp.body);
      EstablecimientoList vets = EstablecimientoList.fromJson(jsonResp);
      if (vets.establecimientos != null) establecimientos = vets.establecimientos;
    }

    // return vets.establecimientos;
    return {
      'code': estado,
      'establecimientos': establecimientos,
    };
  }

  Future<dynamic> getVet(String idVet) async {
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    final url = '$_url/establishments/$idVet?latitude=$lat&longitude=$lng';

    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    // print(resp.statusCode);

    if (resp.statusCode == 200) {
      final jsonResp = json.decode(resp.body);
      EstablecimientoModel vets = EstablecimientoModel.fromJson(jsonResp["establishment"]);

      return {'status': 200, 'establishment': vets};
    } else {
      return {'status': 205, 'establishment': null};
    }
  }

  Future<List<Comentarios>> getComents(String idVet) async {
    final url = '$_url/establishment/$idVet/comments';

    List<Comentarios> comentarios = [];

    final resp = await http.get(url, headers: headersToken());
    if (resp.statusCode == 200) {
      comentarios = comentariosFromJson(resp.body);
    }
    return comentarios;
  }
}
