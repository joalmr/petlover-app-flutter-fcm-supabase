import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';

class PetVaccinesProvider {
  final _url = urlApi;

  /* Get */
  Future<List<dynamic>> getVaccines(String idPet) async {
    final url = Uri.parse('$_url/pet/$idPet/history?type=vaccination');
    final response = await http.get(url, headers: headersToken());

    final jsonData = jsonDecode(response.body);

    final list = List<dynamic>.from(jsonData);
    return list;
  }
}
