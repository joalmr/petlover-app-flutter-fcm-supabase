import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/model/raza/raza_model.dart';

class RazaProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  Future<RazaModel> getBreed(String idRaza) async {
    final url = '$_url/breeds/?specie=$idRaza';

    // final resp = await http.get(url, headers: headersToken());
    Response response;
    response = await dio.get(
      url,
      options: buildCacheOptions(
        Duration(days: 7),
        options: Options(headers: headersToken()),
      ),
    );

    final razaModel = RazaModel.fromJson(response.data);
    // final razaModel = razaModelFromJson(resp.body);
    return razaModel;
  }
}
