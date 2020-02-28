import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'dart:convert';

import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class MascotaProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<MascotaModel> getPets() async {
    final url = '$_url/pet/mypets';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosMascota = mascotaModelFromJson(resp.body);
    
    return datosMascota;

  }

  Future<bool> savePet(Pet mascota) async {
    //http://www.proypet.localhost/api/pets
    final url = '$_url/pets';

    final petData = {
      'name':mascota.name, 
      'birthdate':mascota.birthdate, 
      'specie':mascota.typeId, 
      'breed':mascota.breedId, 
      'genre':mascota.genre
    };

    final resp = await http.post(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      },
      body: petData
    );

    print(resp.statusCode);

    return true;

  }
}