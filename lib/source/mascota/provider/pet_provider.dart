import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/mascota/model/pet_model.dart';

class PetProvider {
  final _url = urlApi;

  /* Get */
  Future<List<MascotaModel2>> getPets() async {
    final url = Uri.parse('$_url/pets');

    final response = await http.get(url, headers: headersToken());
    final jsonData = jsonDecode(response.body);

    final pets = List<MascotaModel2>.from(
        jsonData["pets"].map((x) => MascotaModel2.fromJson(x)));

    return pets;
  }

  /* Get */
  Future<MascotaModel2> getPet(String idPet) async {
    final url = Uri.parse('$_url/pets/$idPet');
    final response = await http.get(url, headers: headersToken());

    final jsonData = jsonDecode(response.body);

    final pet = MascotaModel2.fromJson(jsonData['pet']);
    return pet;
  }

  /* Post */
  Future<bool> deletePet(String idPet) async {
    try {
      final url = Uri.parse('$_url/pets/$idPet/delete');
      final response = await http.post(url, headers: headersToken());

      if (response.statusCode == 200) return true;
      return false;
    } catch (ex) {
      return false;
    }
  }
}
