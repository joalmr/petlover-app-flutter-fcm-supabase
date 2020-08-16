import 'package:proypet/src2/data/providers/notificacion_provider.dart';

class NotificacionService {
  final NotificacionProvider notificacionProvider = NotificacionProvider();

  getNotificacion() {
    return notificacionProvider.getNotificacion();
  }
}
