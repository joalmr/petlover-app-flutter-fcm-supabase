import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proypet/src2/controllers/_push_controller.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/data/services/auth_service.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';

class GlobalController extends GetxController {
  final AuthService repository = AuthService();
  final _prefs = new PreferenciasUsuario();
  PushController pushController = PushController();
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    evaluaLogin();
    if (_prefs.themeMode != null) {
      if (_prefs.themeMode == 'claro') {
        Get.changeThemeMode(ThemeMode.light);
      } else {
        Get.changeThemeMode(ThemeMode.dark);
      }
    }
  }

  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";
  bool get isVerify => _prefs.verify != null && _prefs.verify.trim() != "";

  evaluaLogin() {
    if (hasToken) {
      if (!isVerify) {
        repository.logOut();
      } else {
        pushController.firebase();
        homeController.getSummary();
      }
    }
  }
}
