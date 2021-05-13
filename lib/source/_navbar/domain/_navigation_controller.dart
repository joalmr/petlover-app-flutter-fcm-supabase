import 'package:get/get.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';

class NavigationController extends GetxController {
  PushController pushController = PushController();
  var currentTabIndex = 0.obs;
  var page = ''.obs;

  @override
  void onInit() {
    super.onInit();
    
    pushController.firebaseConfigure(); //TODO: firebase

    page.value = Get.parameters['page'];

    switch (page.value) {
      case 'notifica':
        currentTabIndex.value=1;
        break;
      case 'lista':
        currentTabIndex.value=2;
        break;
      case 'recompensa':
        currentTabIndex.value=3;
        break;
      default:
        currentTabIndex.value=0;
        break;
    }
  }
}
