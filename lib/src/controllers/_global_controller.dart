import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proypet/src/controllers/_push_controller.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/update/usuario/user_model.dart';
import 'package:proypet/src/data/services/auth_service.dart';
import 'package:proypet/src/data/services/user_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class GlobalController extends GetxController {
  final repository = AuthService();
  final userService = UserService();

  final _prefs = new PreferenciasUsuario();
  final pushController = PushController();
  final homeController = Get.find<HomeController>();

  Rx<UserModel2> _usuario = UserModel2().obs;
  set usuario(UserModel2 value) => _usuario.value = value;
  UserModel2 get usuario => _usuario.value;

  @override
  void onInit() {
    super.onInit();
    getTema();
    evaluaLogin();
  }

  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";
  bool get isVerify => _prefs.verify != null && _prefs.verify.trim() != "";

  getTema() {
    if (_prefs.themeMode != null) {
      if (_prefs.themeMode == 'claro') {
        Get.changeThemeMode(ThemeMode.light);
      } else {
        Get.changeThemeMode(ThemeMode.dark);
      }
    }
  }

  evaluaLogin() {
    if (hasToken) {
      if (!isVerify) {
        repository.logOut();
      } else {
        pushController.firebase();
        getUsuario();
        homeController.getSummary();
      }
    }
  }

  getUsuario() => _getUsuario();

  _getUsuario() async {
    usuario = await userService.getUser();
    print(usuario.phone);
  }
}
