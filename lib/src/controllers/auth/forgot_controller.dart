import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/data/services/auth/auth_service.dart';

class ForgotController extends GetxController {
  final AuthService repository = AuthService();

  final _email = ''.obs;
  final loading = false.obs;

  set email(String value) => _email.value = value;
  String get email => this._email.value;

  bool get hasEmailData => email.trim().length > 0;

  bool get isEmailValid => EmailValidator.validate(email);

  bool get isFormValid => hasEmailData;

  @override
  void onInit() {
    super.onInit();
    limpia();
  }

  @override
  void onClose() {
    limpia();
    super.onClose();
  }

  limpia() {
    email = '';
    loading.value = false;
  }

  void getForgot() => forgot();

  Future<void> forgot() async {
    loading.value = true;
    if (!isEmailValid) {
      mostrarSnackbar("Ingrese un correo valido", colorRed);
      Timer(Duration(milliseconds: 500), () => loading.value = false);
    } else {
      int resp = await repository.forgot(email);
      if (resp == 200) {
        mostrarSnackbar(
            "Se le envío un correo electrónico a la dirección ingresada",
            colorMain);
        Timer(Duration(milliseconds: 3500), () {
          loading.value = false;
          Get.until((route) => route.isFirst);
        });
      } else if (resp == 205) {
        mostrarSnackbar("Este correo no esta registrado en Proypet", colorRed);
        Timer(Duration(milliseconds: 500), () => loading.value = false);
      } else {
        mostrarSnackbar("Oops.. ocurrió un error", colorRed);
        Timer(Duration(milliseconds: 500), () => loading.value = false);
      }
    }
  }
}
