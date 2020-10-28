import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/controllers/_push_controller.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/services/auth_service.dart';

import '../_global_controller.dart';

class LoginController extends GetxController {
  final AuthService repository = AuthService();

  final _email = ''.obs;
  final _password = ''.obs;
  final passwordVisible = false.obs;
  final loading = false.obs;

  RxBool isLoggedIn = false.obs;

  set email(String value) => _email.value = value;
  String get email => this._email.value;

  set password(String value) => _password.value = value;
  String get password => this._password.value;

  void togglePasswordVisibility() => passwordVisible.value = !passwordVisible.value;

  bool get hasEmailData => email.trim().length > 0;
  bool get isEmailValid => EmailValidator.validate(email);
  bool get isPasswordValid => password.trim().length > 0;
  bool get isFormValid => hasEmailData && isPasswordValid;

  final pushController = PushController();
  final homeController = Get.find<HomeController>();
  final globalController = Get.find<GlobalController>();

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
    loading.value = false;
  }

  void getLogin() => login();

  Future<void> login() async {
    loading.value = true;
    if (isFormValid) {
      if (!isEmailValid) {
        Timer(Duration(milliseconds: 500), () => loading.value = false);
        mostrarSnackbar('Ingrese un correo valido', colorRed);
      } else {
        Map<String, dynamic> respLogin = await repository.login(email, password);
        if (respLogin['code'] == 200) {
          loading.value = false;
          ejecutaFirebase();
        } else {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar(respLogin['message'], colorRed);
        }
      }
    } else {
      Timer(Duration(milliseconds: 500), () => loading.value = false);
      mostrarSnackbar('Complete los datos', colorRed);
    }
  }

  //
  void initFacebookLogin() async {
    final fb = FacebookLogin();
    // var result = await login.logIn(['email']);
    final result = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (result.status) {
      case FacebookLoginStatus.Success:
        {
          // final FacebookAccessToken accessToken = result.accessToken;
          final fbProfile = await fb.getUserProfile();
          final fbEmail = await fb.getUserEmail();
          // final fbImageUrl = await fb.getProfileImageUrl(width: 100);

          var nombre = fbProfile.firstName;
          var apellido = fbProfile.lastName;
          var email = fbEmail;
          var fbId = fbProfile.userId;

          Map<String, dynamic> respLogin = await repository.loginFb(nombre, apellido, email, fbId);
          if (respLogin['code'] == 200) {
            ejecutaFirebase();
          } else {
            Timer(Duration(milliseconds: 500), () => loading.value = false);
            mostrarSnackbar(respLogin['message'], colorRed);
          }
        }
        break;
      case FacebookLoginStatus.Cancel:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('El usuario canceló los permisos', colorRed);
        }
        break;
      case FacebookLoginStatus.Error:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Acceso denegado', colorRed);
        }
        break;
    }
  }

  void onLoginStatusChange(bool isLogged) {
    isLoggedIn.value = isLogged;
  }

  ejecutaFirebase() {
    pushController.firebase(); //TODO: el firebase de ios mantiene prod
    globalController.getUsuario();
    homeController.getSummary();
    Get.offAllNamed('navInicio');
  }
}
