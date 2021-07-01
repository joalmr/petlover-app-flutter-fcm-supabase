import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/_global/_global_controller.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';

class NavigationController extends GetxController {
  PushController pushController = PushController();
  var page = ''.obs;

  @override
  void onInit() {
    super.onInit();
    
    pushController.firebaseConfigure();

    page.value = Get.parameters['page'];

    switch (page.value) {
      case 'inicio':
        Get.find<GlobalController>().currentTabIndex.value=0;
        break;
      case 'notifica':
        Get.find<GlobalController>().currentTabIndex.value=1;
        break;
      case 'lista':
        Get.find<GlobalController>().currentTabIndex.value=2;
        break;
      case 'recompensa':
        Get.find<GlobalController>().currentTabIndex.value=3;
        break;
      default:
        Get.find<GlobalController>().currentTabIndex.value=0;
        break;
    }
  }

  DateTime currentBackPressTime;

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Presione salir dos veces'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
