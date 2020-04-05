import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/bonificacion/bonificacion_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class BonificacionProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

    Future<BonificacionModel> getBonificacion() async {
    final url = '$_url/bonifications';

    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    // final jsonResp = json.decode(resp.body);
    BonificacionModel bonificacion = bonificacionModelFromJson(resp.body);
    return bonificacion;
  }

}