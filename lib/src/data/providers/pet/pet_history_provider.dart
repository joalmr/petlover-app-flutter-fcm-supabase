import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/providers/pet/model/pet_history_model.dart';

class PetHistoryProvider {
  final _url = urlApi;
  Dio dio = new Dio();
  /* Get */
  Future<List<PetHistoryModel>> getPetHistory(String idPet) async {
    final url = '$_url/pet/$idPet/history';
    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );

    final listHistory = List<PetHistoryModel>.from(
        response.data.map((x) => PetHistoryModel.fromJson(x)));

    return listHistory;
  }

  /* Get */
  Future<List<PetHistoryModel>> getPetHistoryDate(
      String idPet, String year, String month) async {
    final url = '$_url/pet/$idPet/history?year=$year&month=$month';

    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );

    final listHistory = List<PetHistoryModel>.from(
        response.data.map((x) => PetHistoryModel.fromJson(x)));

    return listHistory;
  }
}
