
import 'dart:io';

import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

final String urlPruebas = '/api';
final String urlProduccion = 'https://proypet.com/api';

final String urlGlobal = urlProduccion;

final _prefs = new PreferenciasUsuario();

headersToken() { 
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
  };
  
}
