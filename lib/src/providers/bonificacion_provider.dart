import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/models/bonificacion/bonificacion_model.dart';

class BonificacionProvider {
  final _url = urlGlobal;

  Future<BonificacionModel> getBonificacion() async {
    final url = '$_url/bonifications';

    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    // final jsonResp = json.decode(resp.body);
    BonificacionModel bonificacion = bonificacionModelFromJson(resp.body);
    return bonificacion;
  }
}
