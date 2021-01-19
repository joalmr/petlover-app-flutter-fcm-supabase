import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import 'model/establecimiento_short_model.dart';

class EstablishmentFindProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  Dio dio = new Dio();

  Future<List<EstablishmentModelList>> findVets(String vetName) async {
    List<EstablishmentModelList> establecimientos = [];
    var filtroServicio = "";
    List<EstablishmentModelList> vets;

    if (_prefs.hasPosition()) {
      String lat = _prefs.position.split(',')[0];
      String lng = _prefs.position.split(',')[1];
      final url =
          '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';
      Response response;
      response = await dio.get(url, options: Options(headers: headersToken()));

      vets = List<EstablishmentModelList>.from(
          response.data.map((x) => EstablishmentModelList.fromJson(x)));

      if (vetName.length > 2) {
        establecimientos = vets
            .where(
                (el) => el.name.toLowerCase().contains(vetName.toLowerCase()))
            .toList();
      }
    }

    return establecimientos;
  }
}
