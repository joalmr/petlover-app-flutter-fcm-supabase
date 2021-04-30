import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/recompensas/model/bonificacion_model.dart';
import 'package:proypet/source/recompensas/model/bonificacion_top_model.dart';

class BonificationProvider {
  final _url = urlApi;

  Future<BonificacionModel> getBonificacion() async {
    final url = Uri.parse('$_url/bonifications');
    final resp = await http.get(url, headers: headersToken());
    BonificacionModel bonificacion = bonificacionModelFromJson(resp.body);
    return bonificacion;
  }

  Future<List<BonificacionTop>> getTop() async {
    final url = Uri.parse('$_url/bonifications/top');
    final resp = await http.get(url, headers: headersToken());
    List<BonificacionTop> top = bonificacionTopFromJson(resp.body);
    return top;
  }
}
