import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';
// import 'package:image/image.dart' as ImageProcess;


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
    final url = '$_url/pets/${mascota.idKey}/delete';

    int intMascota=0;
    if( mascota.genre) intMascota=1;    
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
      final idkey = mascota.idKey;
      final urlpet = '$_url/pets/$idkey/base64';

      upImage(imagen,urlpet);
      return true;
    }
    else return false;


  }

  Future<bool> savePet(MascotaReq mascota, File imagen) async {
    final url = '$_url/pets';
    
    int intMascota=0;

    if( mascota.genre) intMascota=1;    
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
      },
      body: {
        'base64':sendPic
      }  
    );

    print(resp.statusCode);

  }

  // Future uploadImage(File imagen,String uri) async {
  //   final url = Uri.parse(uri);
  //   final mimetype = mime(imagen.path).split('/'); //image/jpeg

  //   final imageUploadRequest = http.MultipartRequest(
  //     'POST',
  //     url
  //   );

  //   final file = await http.MultipartFile.fromPath(
  //     'picture', 
  //     imagen.path,
  //     contentType: MediaType(mimetype[0],mimetype[1])
  //   );

  //   imageUploadRequest.files.add(file);

  //   final streamResponse = await imageUploadRequest.send();
  //   final resp = await http.Response.fromStream(streamResponse);

  //   if(resp.statusCode!=200 || resp.statusCode!=201){
  //     print('Algo salió mal');
  //     print(resp.body);
  //     return null;
  //   }

  //   final respData = json.decode(resp.body);

  //   print(respData);
  // }
}