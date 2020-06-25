import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';

import 'package:proypet/src/model/notificacion/add_noti.dart';
import 'dart:math' as Math;

class NotificacionProvider{
  final _url = urlGlobal;

  Future<NotificacionModel> getNotificacion() async {
    final url = '$_url/notifications';
    final resp = await http.get(url, headers: headersToken(),);

    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);

    notificacionModel.notifications.forEach((element) {
      element.message = '${element.message} ${addNoti[Math.Random().nextInt(addNoti.length)]}';
                      
    });
    return notificacionModel;
  }
}