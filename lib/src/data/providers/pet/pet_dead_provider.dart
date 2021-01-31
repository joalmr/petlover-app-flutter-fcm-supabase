import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';

class PetDeadProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  /* Post */
  Future<bool> muerePet(String idMascota) async {
    final url = '$_url/pets/$idMascota/decease';

    Response response;
    response = await dio.post(
      url,
      options: Options(headers: headersToken()),
    );
    await dio.post(url, options: Options(headers: headersToken()));

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  /* Post */
  Future<bool> revivePet(String idMascota) async {
    final url = '$_url/pets/$idMascota/revive';

    Response response;
    response = await dio.post(
      url,
      options: Options(headers: headersToken()),
    );
    await dio.post(url, options: Options(headers: headersToken()));

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
