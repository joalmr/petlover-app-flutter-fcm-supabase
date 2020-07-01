import 'dart:io';

import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

final String keyMap = 'AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844';

final String urlDev = 'http://18.188.214.204';
final String urlPro = 'https://proypet.com';

final String urlPruebas = '$urlDev/api';
final String urlProduccion = '$urlPro/api';

final String urlDir = urlPruebas.split('/api')[0]; // TODO: cambiar servicio

final String urlGlobal = urlPruebas; // TODO: cambiar servicio

final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}"
  };
}
