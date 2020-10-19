import 'dart:async';
import 'package:email_validator/email_validator.dart';
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
}
