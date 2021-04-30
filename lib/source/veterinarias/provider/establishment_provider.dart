import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/veterinarias/model/establecimiento_model.dart';
import 'package:proypet/source/veterinarias/model/establecimiento_short_model.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

class EstablishmentProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  Future<dynamic> getVets(dynamic filtros) async {
    // establishments/list
    List<EstablishmentModelList> establecimientos = [];
    if (!_prefs.hasPosition()) {
      return {
        'code': 211,
        'establecimientos': establecimientos,
      };
    }

    var filtroServicio;
    if (filtros.length > 0) {
      filtroServicio = filtros;
    } else {
      filtroServicio = "";
    }

    String lat = _prefs.position.split(',')[0];
    String lng = _prefs.position.split(',')[1];

    final url = Uri.parse(
        '$_url/establishments/list?services=$filtroServicio&latitude=$lat&longitude=$lng');

    final response = await http.get(url, headers: headersToken());

    final vets = List<EstablishmentModelList>.from(json
        .decode(response.body)
        .map((x) => EstablishmentModelList.fromJson(x)));

    if (vets.length > 0) establecimientos = vets;

    return {
      'code': 200,
      'establecimientos': establecimientos,
    };
  }

  Future<dynamic> getVet(String idVet) async {
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    final url =
        Uri.parse('$_url/establishments/$idVet?latitude=$lat&longitude=$lng');

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode != 200) {
      return {'status': 205, 'establishment': null};
    }

    final jsonResp = json.decode(resp.body);
    EstablecimientoModel vets =
        EstablecimientoModel.fromJson(jsonResp["establishment"]);

    return {'status': 200, 'establishment': vets};
  }
}
