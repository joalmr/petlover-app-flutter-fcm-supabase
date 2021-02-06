import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';

class PetDeadProvider {
  final _url = urlApi;

  /* Post */
  Future<bool> muerePet(String idMascota) async {
    final url = '$_url/pets/$idMascota/decease';

    final response = await http.post(url, headers: headersToken());

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  /* Post */
  Future<bool> revivePet(String idMascota) async {
    final url = '$_url/pets/$idMascota/revive';
    final response = await http.post(url, headers: headersToken());

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
