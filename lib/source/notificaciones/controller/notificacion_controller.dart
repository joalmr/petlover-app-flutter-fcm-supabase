import 'package:get/get.dart';
import 'package:proypet/source/notificaciones/model/notificacion_model.dart';
import 'package:proypet/source/notificaciones/service/notification_service.dart';

class NotificacionController extends GetxController {
  final notificacionService = NotificationService();

  NotificacionModel notificationModel;
  RxList<Notificacion> notifications = <Notificacion>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNotificacion();
    // prefUser.notificaAviso = false;
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
