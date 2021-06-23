import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

//TODO: cambiar google-services para android

String versionAndroid = "";
String versionIOS = "";

final bool appPruebas = dotenv.env['TEST'] == '1' ? true : false;

// http://18.188.214.204
final String keyMap = dotenv.env['KEY_MAP'];
final String urlName = dotenv.env['URL'];
final String urlApi = dotenv.env['URL_API'];

final prefUser = new PreferenciasUsuario();

headersToken() {
  return {
    HttpHeaders.authorizationHeader: "Bearer ${prefUser.token}",
    "X-Requested-With": "XMLHttpRequest",
  };
}
