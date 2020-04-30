import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';


class MascotaProvider{
  final _url = urlGlobal;

  Future<List<MascotaModel>> getPets() async {
    final url = '$_url/pets';
    try {
      final resp = await http.get(url,headers: headersToken(),
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

  Future<PetModel> getPet(String idPet) async {
    final url = '$_url/pets/$idPet';

    final resp = await http.get(url, headers: headersToken(),);
    final petModel = petModelFromJson(resp.body);
    
    return petModel;
  }

  Future<bool> savePet(MascotaModel mascota, File imagen) async { //create
    final url = '$_url/pets';
    
    // int intMascota=0;
    // if(mascota.genre) intMascota=1;    
    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specieId.toString(), //int
      'breed': mascota.breedId.toString(), //int
      'genre': mascota.genre.toString(), //int
    };

    final resp = await http.post(url, headers: headersToken(),     
      body: data,
    );

    if(resp.statusCode==200 || resp.statusCode==201){
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      final idkey = decodedResp['pet']['id'];
      final urlpet = '$_url/pets/$idkey/base64';

      upImage(imagen,urlpet);
      return true;
    }
    else return false;

  }

  Future<Map<String,dynamic>> editPet(MascotaModel mascota, File imagen) async {
    final url = '$_url/pets/${mascota.id}';
    String img="";
    // int intMascota=0;
    // if() intMascota=1;    
    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specieId.toString(), //int
      'breed': mascota.breedId.toString(), //int
      'genre': mascota.genre.toString(), //int
      // 'status': mascota.status.toString(), //int
    };

    final resp = await http.post(url, headers: headersToken(),
      body: data,
    );

    if(resp.statusCode==200 || resp.statusCode==201){
      if(imagen!=null){
        final idkey = mascota.id;
        final urlpet = '$_url/pets/$idkey/base64';
        img = await upImage(imagen,urlpet);
      }
      return {
        'edit': true,
        'picture': img
      };  
    }
    else return {
      'edit': false,
      'picture': ""
    };
  }

  Future<bool> muerePet(MascotaModel mascota) async {
    final url = '$_url/pets/${mascota.id}';

    // int intMascota=0;
    // if(mascota.genre) intMascota=1;    
    final data = {
      'name': mascota.name, 
      'birthdate': mascota.birthdate, //datetime
      'specie': mascota.specieId.toString(), //int
      'breed': mascota.breedId.toString(), //int
      'genre': mascota.genre.toString(), //int
      'status': mascota.status.toString(), //int
    };

    final resp = await http.post(url, headers: headersToken(),
      body: data,
    );

    if(resp.statusCode==200 || resp.statusCode==201) return true;
    else return false;
  }

  Future<bool> deletePet(String idPet) async {
    try {
      final url = '$_url/pets/$idPet/delete';
      await http.post(url, headers: headersToken(),);
      return true;
    }
    catch(ex) {
      return false;
    }
  }

  Future<String> upImage(File imagen,String url) async {
    final imageBytes = imagen.readAsBytesSync();
    final pic = base64.encode(imageBytes);
    final mimetype = mime(imagen.path).split('/');
    final part0 = mimetype[0];
    final part1 = mimetype[1];

    String sendPic = 'data:$part0/$part1;base64,$pic';

    var img = await http.post(url, headers: headersToken(), 
      body: { 'base64':sendPic }
    );

    var decodeimg = json.decode(img.body);
    print(decodeimg["picture"]);
    return decodeimg["picture"];
  }

}