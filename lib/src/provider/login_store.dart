import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src2/data/services/auth_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // _LoginStore() { autorun((_) {}); }

  // UserDato userModel = UserDato();
  // final loginProvider = UserProvider();
  final loginApi = AuthService(); //api
  final _prefs = new PreferenciasUsuario();

  @observable
  String rutaInicio = 'login';

  @action
  void evaluaIngreso() {
    evaluaLogin();
  }

  @action
  Future<void> evaluaLogin() async {
    // final loginProvider = UserProvider();
    // final loginApi = LoginService();
    if (hasToken) {
      if (!isVerify) {
        // loginProvider.logOut();
        loginApi.logOut();
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
