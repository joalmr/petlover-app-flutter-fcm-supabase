import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
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
          pushController.firebase(); //TODO: el firebase de ios mantiene prod
          globalController.getUsuario();
          homeController.getSummary();
          loading.value = false;
          Get.offAllNamed('navInicio');
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
    var login = FacebookLogin();
    var result = await login.logIn(['email']);
    print(result.status);
    switch (result.status) {
      case FacebookLoginStatus.error:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Acceso denegado', colorRed);
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('El usuario canceló los permisos', colorRed);
        }
        break;
      case FacebookLoginStatus.loggedIn:
        {
          Dio dio = new Dio();
          final token = result.accessToken.token;
          final url = 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token';
          Response response;
          response = await dio.get(url);

          final resp = jsonDecode(response.data);
          onLoginStatusChange(true);
          var nombre = resp['first_name'];
          var apellido = resp['last_name'];
          var email = resp['email'];
          var fbId = resp['id'];
          Map<String, dynamic> respLogin = await repository.loginFb(nombre, apellido, email, fbId);
          if (respLogin['code'] == 200) {
            pushController.firebase(); //TODO: el firebase de ios mantiene prod
            globalController.getUsuario();
            homeController.getSummary();
            Get.offAllNamed('navInicio');
          } else {
            Timer(Duration(milliseconds: 500), () => loading.value = false);
            mostrarSnackbar(respLogin['message'], colorRed);
          }
        }
        break;
    }
  }

  void onLoginStatusChange(bool isLogged) {
    isLoggedIn.value = isLogged;
    print(isLoggedIn.value);
  }
}
