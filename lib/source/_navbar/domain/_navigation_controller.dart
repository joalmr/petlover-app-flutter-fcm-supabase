import 'package:get/get.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';

class NavigationController extends GetxController {
  PushController pushController = PushController();

  @override
  void onInit() {
    super.onInit();
//TODO: firebase
    // pushController.firebaseConfigure();
  }
}
