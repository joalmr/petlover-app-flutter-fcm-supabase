import 'package:get/get.dart';
import 'package:proypet/src/models/notificacion/notificacion_model.dart';
import 'package:proypet/src2/data/services/notificacion_servicio.dart';

class NotificacionController extends GetxController {
  final notificacionService = NotificacionService();

  NotificacionModel notificationModel;
  List<Notificacion> notifications;
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNotificacion();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getNotificacion();
    return null;
  }

  void getNotificacion() {
    _notificacion();
  }

  Future<void> _notificacion() async {
    notificationModel = await notificacionService.getNotificacion();
    notifications = notificationModel.notifications;
    loading.value = false;
  }
}
