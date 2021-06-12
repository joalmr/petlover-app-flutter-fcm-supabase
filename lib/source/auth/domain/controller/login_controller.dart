import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/_global/_global_controller.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';
// import 'package:proypet/source/auth/data/service/facebook_sing.dart';
import 'package:proypet/source/auth/data/service/google_sign.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/notificaciones/controller/_push_controller.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';


class LoginController extends GetxController {
  final AuthService repository = AuthService();

  //TODO: sin facebook
  
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
        mostrarSnackbar(
            'Ingrese un correo valido, contiene espacios u otros carácteres',
            colorRed);
      } else {
        final respLogin = await repository.login(email, password);
        print(respLogin);
        retornosWithMail(respLogin);
      }
    }
  }

  // void loginFacebook() async {
  //   int result = await FacebookSignInService.signIn();
  //   print(result);
  //   retornos(result);
  // }

  loginGoogle() async {
    int result = await GoogleSignInService.signIn();
    retornos(result);
  }

  retornosWithMail(result) {
    switch (result) {
      case 200:
        {
          loading.value = false;
          ejecutaFirebase();
        }
        ejecutaFirebase();
        break;
      case 401:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Error, usuario o clave incorrecta', colorRed);
        }
        break;
      case 500:
        Timer(Duration(milliseconds: 500), () => loading.value = false);
        mostrarSnackbar('Error del servidor, inténtelo más tarde', colorRed);
        break;
    }
  }

  retornos(result) {
    switch (result) {
      case 200:
        {
          //! TODO: no funciona
          print('fb 200');
          // ejecutaFirebase();
        }
        break;
      case 401:
        {
          Timer(Duration(milliseconds: 500), () => loading.value = false);
          mostrarSnackbar('Error, inténtelo más tarde', colorRed);
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
        mostrarSnackbar('Error del servidor, inténtelo más tarde', colorRed);
        break;
    }
  }

  ejecutaFirebase() {
    pushController.firebase(); //TODO: firebase
    homeController.getUsuario();
    homeController.getSummary();
    vetsController.getVets();
    Get.offAllNamed('nav/inicio');
  }
}
