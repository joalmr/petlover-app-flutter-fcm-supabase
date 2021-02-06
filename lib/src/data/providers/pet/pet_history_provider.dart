import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/pet/pet_history_model.dart';

class PetHistoryProvider {
  final _url = urlApi;
  /* Get */
  Future<List<PetHistoryModel>> getPetHistory(String idPet) async {
    final url = '$_url/pet/$idPet/history';
    final response = await http.get(url, headers: headersToken());

    final jsonData = jsonDecode(response.body);

    final listHistory = List<PetHistoryModel>.from(
        jsonData.map((x) => PetHistoryModel.fromJson(x)));

    return listHistory;
  }

  /* Get */
  Future<List<PetHistoryModel>> getPetHistoryDate(
      String idPet, String year, String month) async {
    final url = '$_url/pet/$idPet/history?year=$year&month=$month';

    final response = await http.get(url, headers: headersToken());

    final jsonData = jsonDecode(response.body);

    final listHistory = List<PetHistoryModel>.from(
        jsonData.map((x) => PetHistoryModel.fromJson(x)));

    return listHistory;
  }
}
