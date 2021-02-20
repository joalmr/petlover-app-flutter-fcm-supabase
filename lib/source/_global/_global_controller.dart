import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/update/view/update_page.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';
import 'package:proypet/source/auth/service/auth_service.dart';
import 'package:proypet/source/update/service/update_service.dart';
import 'package:proypet/source/usuario/service/address_service.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

class GlobalController extends GetxController {
  final repository = AuthService();
  final updateApp = UpdateService();
  final addressService = AddressService();

  final _prefs = new PreferenciasUsuario();
  final pushController = PushController();

  RxString _ubicacion = ''.obs;
  set ubicacion(String value) => _ubicacion.value = value;
  String get ubicacion => _ubicacion.value;

  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";
  // bool get hasToken => !_prefs.token.isNullOrBlank;

  bool get isVerify => _prefs.verify != null && _prefs.verify.trim() != "";

  @override
  void onInit() {
    super.onInit();
    ubicacion = _prefs.ubicacion ?? '';
    getInit();
  }

  getInit() async {
    bool needUpdate = await updateApp.setAppUpdate();

    if (needUpdate) {
      showDialog(
        context: Get.context,
        barrierDismissible: false,
        useSafeArea: true,
        child: AlertDialog(
          scrollable: true,
          content: updateView(),
        ),
      );
    } else {
      getTema();
      evaluaLogin();
    }
  }

  getTema() {
    if (_prefs.themeMode != null) {
      if (_prefs.themeMode == 'claro')
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
    final _tempLat = _prefs.position.toString().split(",")[0];
    final _tempLng = _prefs.position.toString().split(",")[1];

    pushController.firebase();
    addressService.setAddress(
      _prefs.ubicacion,
      _tempLat,
      _tempLng,
    );
  }
}
