import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/model/notificacion/notificacion_model.dart';
import 'dart:math' as Math;

import 'package:proypet/src/utils/add_msg.dart';

class NotificacionProvider {
  final _url = urlApi;

  Future<NotificacionModel> getNotificacion() async {
    final url = '$_url/notifications';
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);

    notificacionModel.notifications.forEach((element) {
      element.message = '${element.message} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}';
    });
    return notificacionModel;
  }
}
