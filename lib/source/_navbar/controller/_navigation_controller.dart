import 'package:get/get.dart';

import '../../notificaciones/controller/_push_controller.dart';

class NavigationController extends GetxController {
  PushController pushController = PushController();

  @override
  void onInit() {
    super.onInit();

    pushController.firebaseConfigure();
  }
}
