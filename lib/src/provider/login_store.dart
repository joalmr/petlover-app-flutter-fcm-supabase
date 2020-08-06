import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/utils/utils.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // _LoginStore() {
  //   autorun((_) {
  //     print(isFormValid);
  //   });
  // }

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @observable
  Map<String, dynamic> respLogin;

  @observable
  String rutaInicio = 'login';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  UserDato userModel = UserDato();
  final loginProvider = UserProvider();
  final _prefs = new PreferenciasUsuario();

  @action
  void getLogin() {
    login();
  }

  @action
  Future login() async {
    loading = true;
    if (isFormValid) {
      userModel.email = email;
      userModel.password = password;
      respLogin = await loginProvider.loginToken(userModel);
    } else {
      respLogin = {'code': 500, 'message': 'Complete los datos'};
    }
    loading = false;
  }

  @action
  void evaluaIngreso() {
    evaluaLogin();
  }

  @action
  Future<void> evaluaLogin() async {
    if (hasToken) {
      if (!isLogin) {
        loginProvider.logOut();
      } else {
        navInicio();
      }
    }
  }

  @action
  void navInicio() {
    rutaInicio = 'navInicio';
  }

  // @action
  // Future<void> navInicioVoid(BuildContext context) async {
  //   Navigator.pushNamed(context, 'navInicio');
  // }

  @computed
  bool get hasToken => _prefs.token != null && _prefs.token.trim() != "";

  @computed
  bool get isLogin => _prefs.verify != null && _prefs.verify.trim() != "";

  @computed
  bool get isEmailValid => email.trim().length > 0;

  @computed
  bool get isPasswordValid => password.trim().length > 0;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
