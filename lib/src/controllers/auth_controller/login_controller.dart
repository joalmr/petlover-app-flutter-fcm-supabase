import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/snackbar.dart';
import 'package:proypet/src/controllers/_push_controller.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/controllers/veterinaria_controller/lista_vets_controller.dart';
import 'package:proypet/src/data/services/auth/auth_service.dart';
import '../_global_controller.dart';
import 'services/facebook_sing.dart';
import 'services/google_sign.dart';

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

  void togglePasswordVisibility() =>
      passwordVisible.value = !passwordVisible.value;

  bool get hasEmailData => email.trim().length > 0;
  bool get isEmailValid => EmailValidator.validate(email);
  bool get isPasswordValid => password.trim().length > 0;
  bool get isFormValid => hasEmailData && isPasswordValid;

  final pushController = PushController();
  final homeController = Get.find<HomeController>();
  final globalController = Get.find<GlobalController>();
  final vetsController = Get.find<VeterinariasController>();

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
    if (!isFormValid) {
      Timer(Duration(milliseconds: 500), () => loading.value = false);
      mostrarSnackbar('Complete los datos', colorRed);
    } else {
      if (!isEmailValid) {
        Timer(Duration(milliseconds: 500), () => loading.value = false);
        mostrarSnackbar('Ingrese un correo valido', colorRed);
      } else {
        Map<String, dynamic> respLogin =
            await repository.login(email, password);
        if (respLogin['code'] == 200) {
          loading.value = false;
          ejecutaFirebase();
        } else {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar(respLogin['message'], colorRed);
        }
      }
    }
  }

  void loginFacebook() async {
    int result = await FacebookSignInService.signIn();
    retornos(result);
  }

  loginGoogle() async {
    int result = await GoogleSignInService.signIn();
    retornos(result);
  }

  retornos(result) {
    switch (result) {
      case 200:
        ejecutaFirebase();
        break;
      case 401:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Error', colorRed);
        }
        break;
      case 408:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('El usuario canceló los permisos', colorRed);
        }
        break;
      case 409:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Acceso denegado', colorRed);
        }
        break;
      case 500:
        Timer(Duration(milliseconds: 500), () => loading.value = false);
        mostrarSnackbar('Error, no se logró ingresar', colorRed);
        break;
    }
  }

  ejecutaFirebase() {
    pushController.firebase();
    homeController.getUsuario();
    homeController.getSummary();
    vetsController.getVets();
    Get.offAllNamed('navInicio');
  }
}
