import 'package:proypet/source/notificaciones/provider/notification_provider.dart';

class NotificationService {
  final notificacionProvider = NotificationProvider();

  getNotificacion() {
    return notificacionProvider.getNotificacion();
  }
}
