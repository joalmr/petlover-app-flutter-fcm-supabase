import 'dart:io';
import 'package:get/get.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

const pruebas = {
  'keyMap': 'AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844',
  'url': 'http://18.188.214.204',
  'urlApi': 'http://18.188.214.204/api',
};

const produccion = {
  'keyMap': 'AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844',
  'url': 'https://proypet.com',
  'urlApi': 'https://proypet.com/api',
};

String versionAndroid = "";
String versionIOS = "";
final bool appPruebas = true;
//TODO: cambiar a false cuando sea produccion - cambiar google-services para android
//TODO: inicio de version 4

final environment = appPruebas ? pruebas : produccion;

final String keyMap = environment['keyMap'];
final String urlName = environment['url'];
final String urlApi = environment['urlApi'];

var mediaAncho = Get.width;

final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}",
    "X-Requested-With": "XMLHttpRequest",
  };
}

// void addCorsHeaders(HttpRequest response) {
//   response.headers.add('Access-Control-Allow-Origin', '*');
//   response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
//   response.headers.add('Access-Control-Allow-Headers',
//       'Origin, X-Requested-With, Content-Type, Accept');
//   response.headers.set("X-Requested-With", "XMLHttpRequest");
// }
