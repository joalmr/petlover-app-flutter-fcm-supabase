import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/raza/raza_model.dart';

class RazaProvider{
  final _url = urlGlobal;

  Future<RazaModel> getBreed(String idRaza) async {
    final url = '$_url/breeds/?specie=$idRaza';
    
    final resp = await http.get(url, headers: headersToken(),);

    final razaModel = razaModelFromJson(resp.body);
    return razaModel;
  }
}