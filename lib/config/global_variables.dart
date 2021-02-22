import 'dart:io';
import 'package:get/get.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

import 'variables_env.dart';

//TODO: cambiar google-services para android

String versionAndroid = "";
String versionIOS = "";

final bool appPruebas = true;
final environment = appPruebas ? pruebas : produccion;

final String keyMap = environment['keyMap'];
final String urlName = environment['url'];
final String urlApi = environment['urlApi'];

final mediaAncho = Get.width;
final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}",
    "X-Requested-With": "XMLHttpRequest",
  };
}

// final bool appPruebas = FlutterConfig.get('TEST') == 'true';
// final String keyMap = FlutterConfig.get('KEY_MAP');
// final String urlName = FlutterConfig.get('URL');
// final String urlApi = FlutterConfig.get('URL_API');
