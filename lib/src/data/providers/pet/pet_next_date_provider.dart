import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';

class PetNextDateProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  /* Get */
  Future<List<dynamic>> getNextDate(String idPet) async {
    final url = '$_url/pet/$idPet/nextdate';
    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );
    final list = List<dynamic>.from(response.data);
    return list;
  }
}
