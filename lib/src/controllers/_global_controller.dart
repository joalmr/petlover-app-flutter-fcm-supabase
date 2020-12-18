import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proypet/src/controllers/_push_controller.dart';
// import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/update/usuario/user_model.dart';
import 'package:proypet/src/data/services/auth_service.dart';
import 'package:proypet/src/data/services/user_service.dart';
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
    // checkUpdate();
  }

  // checkUpdate() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //   int serverLatestVersion = 20;
  //   int localVersion = int.parse(packageInfo.buildNumber);
  //   print(localVersion);

  //   if (serverLatestVersion > localVersion) {
  //     NativeUpdater.displayUpdateAlert(
  //       Get.context,
  //       forceUpdate: true,
  //       appStoreUrl: 'https://apps.apple.com/pe/app/proypet/id1529231253',
  //       playStoreUrl:
  //           'https://play.google.com/store/apps/details?id=com.proypet.user',
  //       // iOSDescription: '<Your iOS description>',
  //       // iOSUpdateButtonLabel: 'Actualizar',
  //       // iOSCloseButtonLabel: 'Salir',
  //     );
  //   }
  // }

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
