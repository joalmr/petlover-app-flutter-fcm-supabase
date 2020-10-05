import 'package:get/get.dart';

import '_push_controller.dart';

class NavigationController extends GetxController {
  PushController pushController = PushController();

  @override
  void onInit() {
    super.onInit();
    // if (Platform.isAndroid) {
    //   fnGetPosition();
    // }
    pushController.firebaseConfigure();
  }
}
