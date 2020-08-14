import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/provider/push_store.dart';
import 'package:proypet/src2/data/services/auth_service.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';

class GlobalController extends GetxController {
  final AuthService repository = AuthService();
  final _prefs = new PreferenciasUsuario();

  @override
  void onInit() {
    super.onInit();
    evaluaLogin();
    print(_prefs.themeMode);
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
    final homeStore = GetIt.I.get<HomeStore>();
    final pushStore = GetIt.I.get<PushStore>();
    if (hasToken) {
      if (!isVerify) {
        repository.logOut();
      } else {
        pushStore.firebase(); //TODO: ejecuta firebase
        homeStore.getSummary();
      }
    }
  }

  //
}
