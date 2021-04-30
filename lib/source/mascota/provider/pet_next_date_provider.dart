import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';

class PetNextDateProvider {
  final _url = urlApi;

  /* Get */
  Future<List<dynamic>> getNextDate(String idPet) async {
    final url = Uri.parse('$_url/pet/$idPet/nextdate');
    final response = await http.get(url, headers: headersToken());
    final list = List<dynamic>.from(jsonDecode(response.body));
    return list;
  }
}
