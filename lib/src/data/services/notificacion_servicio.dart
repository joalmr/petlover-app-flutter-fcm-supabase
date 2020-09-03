import 'package:proypet/src/data/providers/notificacion_provider.dart';

class NotificacionService {
  final NotificacionProvider notificacionProvider = NotificacionProvider();

  getNotificacion() {
    return notificacionProvider.getNotificacion();
  }
}
