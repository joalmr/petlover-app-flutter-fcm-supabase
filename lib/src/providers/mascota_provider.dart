import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';


import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class MascotaProvider{
  final _url = 'http://ce2019121721001.dnssw.net/api';
  final _prefs = new PreferenciasUsuario();

  Future<List<MascotaModel>> getPets() async {
    final url = '$_url/pets';

    try {

      final resp = await http.get(url,
        headers: { 
          HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
        }
      );

      final Map<String, dynamic> decodedResp = json.decode(resp.body);

      final datosMascota = decodedResp['pets'];//mascotaModelFromJson(decodedResp['pets']);

      final List<MascotaModel> mascotas = new List();

      if(datosMascota==null) return [];

      datosMascota.forEach((pet){
        final petTemp = MascotaModel.fromJson(pet);
        mascotas.add(petTemp);
      });

      return mascotas;

    }
    catch(e) {

      return [];

    }

    
  }

  Future<bool> editPet(MascotaReq mascota, File imagen) async {
    final url = '$_url/pets/${mascota.idKey}';

    int intMascota=0;
    if( mascota.genre) intMascota=1;    
    else intMascota=0;

    print(mascota.birthdate);
    print(mascota.breed);
    print(mascota.genre);
    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specie.toString(), //int
      'breed': mascota.breed.toString(), //int
      'genre': intMascota.toString(), //int
    };

    final resp = await http.post(url, 
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      },      
      body: data,
    );

    // print(resp.statusCode);
    if(resp.statusCode==200 || resp.statusCode==201){
      if(imagen!=null){
        final idkey = mascota.idKey;
        final urlpet = '$_url/pets/$idkey/base64';

        upImage(imagen,urlpet);
            
      }
      return true;  
    }
    else return false;
  }

  Future<bool> savePet(MascotaReq mascota, File imagen) async { //create
    final url = '$_url/pets';
    
    int intMascota=0;

    if(mascota.genre) intMascota=1;    
    else intMascota=0;

    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specie.toString(), //int
      'breed': mascota.breed.toString(), //int
      'genre': intMascota.toString(), //int
    };

    final resp = await http.post(url, 
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      },      
      body: data,
    );

    print(resp.statusCode);
    if(resp.statusCode==200 || resp.statusCode==201){
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      final idkey = decodedResp['pet']['id'];
      final urlpet = '$_url/pets/$idkey/base64';

      upImage(imagen,urlpet);
      return true;
    }
    else return false;

  }

  Future upImage(File imagen,String url) async {
    final imageBytes = imagen.readAsBytesSync();
    final pic = base64.encode(imageBytes);
    final mimetype = mime(imagen.path).split('/');
    final part0 = mimetype[0];
    final part1 = mimetype[1];

    String sendPic = 'data:$part0/$part1;base64,$pic';

    final resp = await http.post(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }, body: { 'base64':sendPic });

    print(resp.statusCode);
  }

  Future<PetModel> getPet(String idPet) async {
    final url = '$_url/pets/$idPet';

    final resp = await http.get(url, headers: { HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" });
    final petModel = petModelFromJson(resp.body);
    
    return petModel;
  }

  Future<bool> deletePet(String idPet) async {
    try {
      final url = '$_url/pets/$idPet/delete';
      await http.post(url, headers: { HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" });
      return true;
    }
    catch(ex) {
      return false;
    }
    
  }
}