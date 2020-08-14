import 'dart:io';

import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';

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

final bool appPruebas = true; //TODO: cambiar a false cuando sea produccion

final environment = appPruebas ? pruebas : produccion;

final String keyMap = environment['keyMap'];
final String urlName = environment['url'];
final String urlApi = environment['urlApi'];

final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}"
  };
}
