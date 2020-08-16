import 'dart:async';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/store/home_store.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/controllers/_push_controller.dart';
import 'package:proypet/src2/data/services/auth_service.dart';

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

  bool get isEmailValid => GetUtils.isEmail(email);

  bool get isPasswordValid => password.trim().length > 0;

  bool get isFormValid => hasEmailData && isPasswordValid;

  HomeStore homeStore;
  // PushStore pushStore;

  PushController pushController = PushController();

  @override
  void onInit() {
    super.onInit();
    limpia();
    homeStore = GetIt.I.get<HomeStore>();
    // pushStore = GetIt.I.get<PushStore>();
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
          pushController.firebase(); //TODO: ejecuta firebase
          //
          homeStore.getSummary();
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
