import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/variables_globales.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';
import 'package:proypet/source/update/view/update_page.dart';
import 'package:proypet/source/update/service/update_service.dart';
import 'package:proypet/source/usuario/service/address_service.dart';

class GlobalController extends GetxController {
  final repository = AuthService();
  final updateApp = UpdateService();
  final addressService = AddressService();
  final pushController = PushController();

  var currentTabIndex = 0.obs;

  RxString _ubicacion = ''.obs;
  set ubicacion(String value) => _ubicacion.value = value;
  String get ubicacion => _ubicacion.value;

  bool get hasToken => prefUser.token != null && prefUser.token.trim() != "";
  bool get isVerify => prefUser.verify != null && prefUser.verify.trim() != "";

  // RxString vetGlobal = prefUser.favoritesVets.first.obs;

  @override
  void onInit() {
    super.onInit();
    ubicacion = prefUser.ubicacion ?? '';
    inicial();
  }

  inicial() async {
    await getTema();
    await getInit();
  }

  getInit() async {
    bool needUpdate = await updateApp.setAppUpdate();

    if (needUpdate) {
      showDialog(
        context: Get.context,
        barrierDismissible: false,
        useSafeArea: true,
        builder: (context) => AlertDialog(
          scrollable: true,
          content: updateView(),
        ),
      );
    } else {
      evaluaLogin();
    }
  }

  getTema() {
    if (prefUser.themeMode != null) {
      if (prefUser.themeMode == 'claro')
        Get.changeThemeMode(ThemeMode.light);
      else
        Get.changeThemeMode(ThemeMode.dark);
    }
  }

  evaluaLogin() {
    if (hasToken) {
      if (!isVerify)
        repository.logOut();
      else
        initApp();
    }
  }

  initApp() {
    print('inicia app');
    pushController.firebase();

    final _tempLat = prefUser.position.toString().split(",")[0];
    final _tempLng = prefUser.position.toString().split(",")[1];

    if (prefUser.hasUbicacion() && prefUser.hasPosition()) {
      print('==actualizar direccion');
      addressService.setAddress(
        prefUser.ubicacion,
        _tempLat,
        _tempLng,
      );
    }
  }
}
