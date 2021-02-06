import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/raza/raza_model.dart';

class RazaProvider {
  final _url = urlApi;

  Future<RazaModel> getBreed(String idRaza) async {
    final url = '$_url/breeds/?specie=$idRaza';

    final response = await http.get(url, headers: headersToken());

    final razaModel = RazaModel.fromJson(jsonDecode(response.body));
    return razaModel;
  }
}
