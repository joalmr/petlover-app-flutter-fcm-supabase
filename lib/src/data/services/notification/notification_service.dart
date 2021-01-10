import 'package:proypet/src/data/providers/notification/notification_provider.dart';

class NotificationService {
  final notificacionProvider = NotificationProvider();

  getNotificacion() {
    return notificacionProvider.getNotificacion();
  }
}
