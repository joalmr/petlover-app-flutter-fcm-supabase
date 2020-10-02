import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/model/bonificacion/bonificacion_model.dart';
import 'package:proypet/src/data/models/model/bonificacion/bonificacion_top_model.dart';

class BonificacionProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  Future<BonificacionModel> getBonificacion() async {
    final url = '$_url/bonifications';

    final resp = await http.get(url, headers: headersToken());

    BonificacionModel bonificacion = bonificacionModelFromJson(resp.body);
    return bonificacion;
  }

  Future<List<BonificacionTop>> getTop() async {
    final url = '$_url/bonifications/top';
    final resp = await http.get(url, headers: headersToken());
    List<BonificacionTop> top = bonificacionTopFromJson(resp.body);
    // print(top);
    return top;
  }
}
