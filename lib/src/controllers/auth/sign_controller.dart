import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/app/views/components/verify_page.dart';
import 'package:proypet/src/data/services/auth/auth_service.dart';

import 'login_controller.dart';

class SignController extends GetxController {
  final AuthService repository = AuthService();

  final _email = ''.obs;
  final _password = ''.obs;
  final _name = ''.obs;
  final _lastname = ''.obs;
  final passwordVisible = false.obs;
  final loading = false.obs;

  RxBool singup = false.obs;

  set email(String value) => _email.value = value;
  String get email => this._email.value;

  set password(String value) => _password.value = value;
  String get password => this._password.value;

  set name(String value) => _name.value = value;
  String get name => _name.value;

  set lastname(String value) => _lastname.value = value;
  String get lastname => _lastname.value;

  void togglePasswordVisibility() =>
      passwordVisible.value = !passwordVisible.value;

  bool get isEmailValid => EmailValidator.validate(email);

  bool get formComplete =>
      name.trim() != "" &&
      lastname.trim() != "" &&
      email.trim() != "" &&
      password.trim() != "";

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
    password = '';
    name = '';
    lastname = '';
    loading.value = false;
  }

  void getSignUp() => signUp();

  Future<void> signUp() async {
    loading.value = true;

    if (!formComplete) {
      mostrarSnackbar("Debe completar los campos", colorRed);
      Timer(Duration(milliseconds: 500), () => loading.value = false);
    } else {
      if (!isEmailValid) {
        mostrarSnackbar(
            "Ingrese un correo valido, contiene espacios u otros carácteres",
            colorRed);
        Timer(Duration(milliseconds: 500), () => loading.value = false);
      } else {
        if (password.length < 5) {
          mostrarSnackbar(
              "La contraseña debe ser no menor a 5 dígitos", colorRed);
          Timer(Duration(milliseconds: 500), () => loading.value = false);
        } else {
          int resp =
              await repository.registerUser(name, lastname, email, password);

          if (resp == 200 || resp == 201) {
            loading.value = false;
            Get.offAll(VerifyPage(textomail: email));
          } else {
            mostrarSnackbar(
                "No se registró el usuario, correo existente", colorRed);
            Timer(Duration(milliseconds: 500), () => loading.value = false);
          }
        }
      }
    }
  }

  void signFacebook() {
    final login = LoginController();
    login.loginFacebook();
  }
}
