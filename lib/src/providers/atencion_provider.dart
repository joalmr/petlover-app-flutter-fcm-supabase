import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/antecion/atencion_model.dart';
import 'package:http/http.dart' as http;

class AtencionProvider {
  final _url = urlApi;

  Future<List<AtencionModel>> getAtenciones() async {
    final url = '$_url/attentions';

    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    List<AtencionModel> atenciones = atencionModelFromJson(resp.body);
    atenciones = atenciones.where((x) => x.stars == null).toList();
    return atenciones;
  }

  Future<bool> calificar(AtencionModel atencion) async {
    final url = '$_url/attentions/${atencion.id}/rate';

    final bodyData = {
      "stars": atencion.stars.toString(),
      "comment": atencion.comment,
    };

    final resp = await http.post(url, headers: headersToken(), body: bodyData);

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
