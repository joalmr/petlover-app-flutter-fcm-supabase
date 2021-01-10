import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/providers/pet/model/pet_model.dart';

class PetProvider {
  final _url = urlApi;
  Dio dio = new Dio();
  /* Get */
  Future<List<MascotaModel2>> getPets() async {
    final url = '$_url/pets';

    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );

    final pets = List<MascotaModel2>.from(
        response.data.map((x) => MascotaModel2.fromJson(x)));

    return pets;
  }

  /* Get */
  Future<MascotaModel2> getPet(String idPet) async {
    final url = '$_url/pets/$idPet';
    Response response;
    response = await dio.get(
      url,
      options: Options(headers: headersToken()),
    );

    final pet = MascotaModel2.fromJson(response.data['pet']);
    return pet;
  }

  /* Post */
  Future<bool> deletePet(String idPet) async {
    try {
      final url = '$_url/pets/$idPet/delete';
      Response response;
      response = await dio.post(
        url,
        options: Options(headers: headersToken()),
      );
      if (response.statusCode == 200) return true;
      return false;
    } catch (ex) {
      return false;
    }
  }
}
