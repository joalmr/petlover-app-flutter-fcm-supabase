import 'dart:io';

import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

final String keyMap = 'AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844';

final String urlDev = 'http://18.188.214.204';
final String urlPro = 'https://proypet.com';

final String urlPruebas = '$urlDev/api';
final String urlProduccion = '$urlPro/api';

//TODO: revisar que este en urlProduccion antes de subir apk
final String urlDir =
    urlPruebas.split('/api')[0]; // TODO: cambiar servicio para produccion

final String urlGlobal = urlPruebas; // TODO: cambiar servicio para produccion

final _prefs = new PreferenciasUsuario();

headersToken() {
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}"
  };
}
