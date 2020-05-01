
import 'dart:io';

import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

final String urlDevAzure = 'http://52.170.234.215/api';
final String urlProdAzure = 'https://proypet.com/api';

final String urlGlobal = urlProdAzure;

final _prefs = new PreferenciasUsuario();

headersToken() { 
  return {
    // HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
  };
  
}
