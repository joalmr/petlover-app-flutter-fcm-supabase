import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/data/services/user_service.dart';

class PasswordController extends GetxController {
  final userService = new UserService();

  final _password = ''.obs;
  final _passwordNueva = ''.obs;

  final passwordVisible = false.obs;
  final passwordVisible2 = false.obs;

  RxBool clickPassword = true.obs;

  void togglePassword1() => passwordVisible.value = !passwordVisible.value;
  void togglePassword2() => passwordVisible2.value = !passwordVisible2.value;

  set password(String value) => _password.value = value;
  String get password => this._password.value;

  set passwordNueva(String value) => _passwordNueva.value = value;
  String get passwordNueva => this._passwordNueva.value;

  @override
  void onInit() {
    super.onInit();
  }

  bool get diferente => password != passwordNueva;

  changePassword() => _changePassword();

  _changePassword() async {
    clickPassword.value = false;
    int resp = await userService.changePassword(password, passwordNueva);
    if (resp == 200) {
      mostrarSnackbar('Se cambió la contraseña.', colorMain);
      Timer(Duration(milliseconds: 1500), () => clickPassword.value = true);
    } else if (resp == 204) {
      mostrarSnackbar('Error, la contraseña debe ser no menor a 5 dígitos.', colorRed);
      Timer(Duration(milliseconds: 1500), () => clickPassword.value = true);
    } else if (resp == 401) {
      mostrarSnackbar('Error, la contraseña actual es incorrecta.', colorRed);
      Timer(Duration(milliseconds: 1500), () => clickPassword.value = true);
    }
  }
}
