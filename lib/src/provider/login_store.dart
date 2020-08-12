import 'dart:async';

import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'package:proypet/src/services/user_provider.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/verify_page.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // _LoginStore() { autorun((_) {}); }

  UserDato userModel = UserDato();
  final loginProvider = UserProvider();
  final _prefs = new PreferenciasUsuario();

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;

  @observable
  String nombre = '';
  @action
  void setNombre(String value) => nombre = value;

  @observable
  String apellido = '';
  @action
  void setApellido(String value) => apellido = value;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @observable
  Map<String, dynamic> respLogin;

  @observable
  String rutaInicio = 'login';

  @observable
  bool passwordVisible = false;
  @action
  void passNotVisible() => passwordVisible = false;
  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void disposeSingUp() {
    setPassword('');
    setNombre('');
    setApellido('');
  }

  @action
  void getLogin() => login();

  Future<void> login() async {
    loading = true;
    if (isFormValid) {
      if (!isEmailValid) {
        mostrarSnackbar('Ingrese un correo valido', colorRed);
      } else {
        userModel.email = email;
        userModel.password = password;
        respLogin = await loginProvider.loginToken(userModel);
        if (respLogin['code'] != 200) {
          mostrarSnackbar(respLogin['message'], colorRed);
        }
      }
    } else {
      mostrarSnackbar('Complete los datos', colorRed);
    }
    loading = false;
  }

  @action
  void olvideClave() => forgot();

  Future<void> forgot() async {
    loading = true;
    if (isEmailValid) {
      int resp = await loginProvider.forgotPassword(email);
      if (resp == 200) {
        mostrarSnackbar("Se le envío un correo electrónico a la dirección ingresada", colorMain);
        Timer(Duration(milliseconds: 3500), () => Get.until((route) => route.isFirst));
      } else if (resp == 205) {
        mostrarSnackbar("Este correo no esta registrado en Proypet", colorRed);
        Timer(Duration(milliseconds: 1000), () => loading = false);
      } else {
        mostrarSnackbar("Error, ejecución denegada", colorRed);
        Timer(Duration(milliseconds: 1000), () => loading = false);
      }
    } else {
      mostrarSnackbar("Ingrese un correo valido", colorRed);
      Timer(Duration(milliseconds: 1000), () => loading = false);
    }
  }

  @action
  void registraUser() => singUp();

  final userProvider = UserProvider();

  Future<void> singUp() async {
    loading = true;
    if (formComplete) {
      if (isEmailValid) {
        if (password.length < 5) {
          mostrarSnackbar("La contraseña debe ser no menor a 5 dígitos", colorRed);
        } else {
          UserDato user = UserDato();
          user.name = nombre;
          user.lastname = apellido;
          user.email = email;
          user.password = password;

          bool resp = await userProvider.registerUser(user);
          if (resp) {
            Get.to(VerifyPage(textomail: email));
          } else {
            mostrarSnackbar("No se registró el usuario, correo existente", colorRed);
          }
        }
      } else {
        mostrarSnackbar("Ingrese un correo valido", colorRed);
      }
    } else {
      mostrarSnackbar("Debe completar los campos", colorRed);
    }
    Timer(Duration(milliseconds: 1000), () => loading = false);
  }

  @computed
  bool get hasEmailData => email.trim().length > 0;

  @computed
  bool get isEmailValid => GetUtils.isEmail(email);

  @computed
  bool get isPasswordValid => password.trim().length > 0;

  @computed
  bool get isFormValid => hasEmailData && isPasswordValid;

  @computed
  bool get formComplete => nombre.trim() != "" && apellido.trim() != "" && email.trim() != "" && password.trim() != "";

  @action
  void evaluaIngreso() {
    evaluaLogin();
  }

  @action
  Future<void> evaluaLogin() async {
    final loginProvider = UserProvider();
    if (hasToken) {
      if (!isVerify) {
        loginProvider.logOut();
      } else {
        rutaInicio = "navInicio";
      }
    }
  }

  @computed
  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";

  @computed
  bool get isVerify => _prefs.verify != null && _prefs.verify.trim() != "";
}
