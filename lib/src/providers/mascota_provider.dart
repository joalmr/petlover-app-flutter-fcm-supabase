import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';


import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class MascotaProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<MascotaModel> getPets() async {
    final url = '$_url/pets';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    final datosMascota = mascotaModelFromJson(resp.body);
    
    return datosMascota;

  }

  Future<bool> savePet(MascotaReq mascota) async {
    final url = '$_url/pets';

    print('llega');
    print(mascota);
    print(mascota.name);
    print(mascota.birthdate);
    print(mascota.specie);
    print(mascota.breed);
    print(mascota.genre);

    int intMascota=0;

    if( mascota.genre) intMascota=1;    
    else intMascota=0;

    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specie.toString(), //int
      'breed': mascota.breed.toString(), //int
      'genre': intMascota.toString() //int
    };
    //print(mascotaReqToJson(mascota));
    //print(data);

    final resp = await http.post(url, 
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      },      
      body: data );

    print(resp.statusCode);
    if(resp.statusCode==200 || resp.statusCode==201) return true;
    else return false;

  }
}