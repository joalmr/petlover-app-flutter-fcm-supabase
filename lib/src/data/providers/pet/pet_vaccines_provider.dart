import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';

class PetVaccinesProvider {
  final _url = urlApi;
  Dio dio = new Dio();
  /* Get */
  Future<List<dynamic>> getVaccines(String idPet) async {
    final url = '$_url/pet/$idPet/history?type=vaccination';
    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );
    final list = List<dynamic>.from(response.data);
    return list;
  }
}
