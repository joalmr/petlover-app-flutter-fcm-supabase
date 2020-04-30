import 'package:http/http.dart' as http;
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';

class NotificacionProvider{
  final _url = urlGlobal;

  Future<NotificacionModel> getNotificacion() async {
    final url = '$_url/notifications';
    final resp = await http.get(url, headers: headersToken(),);

    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);

    return notificacionModel;
  }
}