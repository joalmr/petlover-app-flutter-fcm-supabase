import 'dart:io';
import 'package:get/get.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter_config/flutter_config.dart';

String versionAndroid = "";
String versionIOS = "";

//TODO: cambiar a false cuando sea produccion - cambiar google-services para android
final bool appPruebas = false;

final String keyMap = FlutterConfig.get('KEY_MAP');
final String urlName = FlutterConfig.get('URL');
final String urlApi = FlutterConfig.get('URL_API');

var mediaAncho = Get.width;

final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}",
    "X-Requested-With": "XMLHttpRequest",
  };
}
