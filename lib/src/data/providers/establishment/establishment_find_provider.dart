import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import '../../models/establishment/establecimiento_short_model.dart';

class EstablishmentFindProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  Future<List<EstablishmentModelList>> findVets(String vetName) async {
    List<EstablishmentModelList> establecimientos = [];
    var filtroServicio = "";
    List<EstablishmentModelList> vets;

    if (!_prefs.hasPosition()) return [];

    String lat = _prefs.position.split(',')[0];
    String lng = _prefs.position.split(',')[1];
    final url =
        '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';
    final response = await http.get(url, headers: headersToken());

    final jsonData = jsonDecode(response.body);
    vets = List<EstablishmentModelList>.from(
        jsonData.map((x) => EstablishmentModelList.fromJson(x)));

    if (vetName.length > 2)
      establecimientos = vets
          .where((el) => el.name.toLowerCase().contains(vetName.toLowerCase()))
          .toList();

    return establecimientos;
  }
}
