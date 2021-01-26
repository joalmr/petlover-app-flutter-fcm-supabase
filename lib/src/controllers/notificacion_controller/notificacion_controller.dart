import 'package:get/get.dart';
import 'package:proypet/src/data/models/notification/notificacion_model.dart';
import 'package:proypet/src/data/services/notification/notification_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class NotificacionController extends GetxController {
  final notificacionService = NotificationService();
  final _prefs = new PreferenciasUsuario();

  NotificacionModel notificationModel;
  RxList<Notificacion> notifications = List<Notificacion>().obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNotificacion();
    _prefs.notificaAviso = false;
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getNotificacion();
    return null;
  }

  void getNotificacion() => _notificacion();

  Future<void> _notificacion() async {
    notificationModel = await notificacionService.getNotificacion();

    notifications.clear();
    notifications.addAll(notificationModel.notifications);

    loading.value = false;
  }
}
