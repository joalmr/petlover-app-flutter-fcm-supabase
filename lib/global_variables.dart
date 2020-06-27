
import 'dart:io';

import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

final String keyMap='AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844';

final String urlPruebas = 'http://danger.proypet.com/api'; //18.188.214.204
final String urlProduccion = 'https://proypet.com/api';

final String urlGlobal = urlPruebas; // TODO: cambiar servicio

final _prefs = new PreferenciasUsuario();

headersToken() { 
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
  };
  
}
