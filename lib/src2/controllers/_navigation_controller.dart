import 'package:get/get.dart';
import 'package:proypet/src2/utils/posicion.dart';

import '_push_controller.dart';

class NavigationController extends GetxController {
  // final _prefs = new PreferenciasUsuario();
  PushController pushController = PushController();

  // RxInt _currentTabIndex = 0.obs;

  // set currentTabIndex(int value) => _currentTabIndex.value = value;
  // int get currentTabIndex => _currentTabIndex.value;

  @override
  void onInit() {
    super.onInit();
    // fnPosition().then((value) => _prefs.position = '${value.latitude},${value.longitude}');
    fnGetPosition();
    pushController.firebaseConfigure();
  }
}
