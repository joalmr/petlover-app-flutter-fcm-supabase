import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/controllers/_push_controller.dart';
import 'package:proypet/src/data/providers/user/model/user_model.dart';
import 'package:proypet/src/data/services/auth/auth_service.dart';
import 'package:proypet/src/data/services/user/user_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class GlobalController extends GetxController {
  final repository = AuthService();
  final userService = UserService();

  final _prefs = new PreferenciasUsuario();
  final pushController = PushController();

  Rx<UserModel2> _usuario = UserModel2().obs;
  set usuario(UserModel2 value) => _usuario.value = value;
  UserModel2 get usuario => _usuario.value;

  RxString _ubicacion = ''.obs;
  set ubicacion(String value) => _ubicacion.value = value;
  String get ubicacion => _ubicacion.value;

  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";
  bool get isVerify => _prefs.verify != null && _prefs.verify.trim() != "";

  @override
  void onInit() {
    super.onInit();
    ubicacion = _prefs.ubicacion ?? '';
    getTema();
    evaluaLogin();
  }

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
      }
    }
  }

  getUsuario() => _getUsuario();

  _getUsuario() async {
    usuario = await userService.getUser();
  }
}
