import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

class NotificacionProvider{
  final _url = urlGlobal;
  final _prefs = new PreferenciasUsuario();

  Future<NotificacionModel> getNotificacion() async {
    final url = '$_url/notifications';
    final resp = await http.get(url,
      headers: { 
        HttpHeaders.authorizationHeader: "Bearer ${_prefs.token}" 
      }
    );

    // final Map<String, dynamic> decodedResp = json.decode(resp.body);
    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);
    // print(notificacionModel.notifications.length);
    // print(notificacionModel.notifications[0]);
    // print(notificacionModel.notifications[0].type);
    return notificacionModel;
  }
}