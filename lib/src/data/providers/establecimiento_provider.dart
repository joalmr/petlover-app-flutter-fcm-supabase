import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/model/establecimiento/comentarios_model.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_short_model.dart';
import 'package:proypet/src/data/models/model/establecimiento/promocion_model.dart';
// import 'package:proypet/src/data/models/model/establecimiento/lista_establecimiento_model.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class EstablecimientoProvider {
  final _url = urlApi;
  final _prefs = new PreferenciasUsuario();

  Dio dio = new Dio();

  Future<List<EstablecimientoModel>> findVets(String vetName) async {
    List<EstablecimientoModel> establecimientos = [];
    var filtroServicio = "";
    List<EstablecimientoModel> vets;

    if (_prefs.hasPosition()) {
      String lat = _prefs.position.split(',')[0];
      String lng = _prefs.position.split(',')[1];
      final url =
          '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';
      Response response;
      response = await dio.get(url, options: Options(headers: headersToken()));

      vets = List<EstablecimientoModel>.from(
          response.data.map((x) => EstablecimientoModel.fromJson(x)));

      if (vetName.length > 2) {
        establecimientos = vets
            .where(
                (el) => el.name.toLowerCase().contains(vetName.toLowerCase()))
            .toList();
      }
    }

    return establecimientos;
  }

  Future<dynamic> getVets(dynamic filtros) async {
    int gpsStatus = 200;
    List<EstablecimientoShortModel> establecimientos = [];
    if (!_prefs.hasPosition()) {
      gpsStatus = 211; //no tiene ubicacion
    }
    if (gpsStatus == 200) {
      String lat = _prefs.position.split(',')[0];
      String lng = _prefs.position.split(',')[1];

      var filtroServicio;
      if (filtros.length > 0) {
        filtroServicio = filtros;
      } else {
        filtroServicio = "";
      }

      final url =
          '$_url/establishments?services=$filtroServicio&latitude=$lat&longitude=$lng';

      Response response;
      response = await dio.get(url, options: Options(headers: headersToken()));

      final vets = List<EstablecimientoShortModel>.from(
          response.data.map((x) => EstablecimientoShortModel.fromJson(x)));
      if (vets.length > 0) establecimientos = vets;
    }

    return {
      'code': gpsStatus,
      'establecimientos': establecimientos,
    };
  }

  Future<dynamic> getVet(String idVet) async {
    String lat = _prefs.position.toString().split(',')[0];
    String lng = _prefs.position.toString().split(',')[1];
    final url = '$_url/establishments/$idVet?latitude=$lat&longitude=$lng';

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) {
      final jsonResp = json.decode(resp.body);
      EstablecimientoModel vets =
          EstablecimientoModel.fromJson(jsonResp["establishment"]);

      return {'status': 200, 'establishment': vets};
    } else {
      return {'status': 205, 'establishment': null};
    }
  }

  Future<List<Comentarios>> getTenComents(String idVet) async {
    final url = '$_url/establishment/$idVet/comments';

    List<Comentarios> comentarios = [];

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) {
      comentarios = comentariosFromJson(resp.body);
    }
    // print(comentarios.take(10));
    return comentarios.take(10).toList();
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

  Future<List<PromocionModel>> getOffers(String idVet) async {
    final url = '$_url/establishment/$idVet/offers';

    List<PromocionModel> promociones = [];

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) {
      promociones = promocionModelFromJson(resp.body);
    }
    return promociones;
  }
}
