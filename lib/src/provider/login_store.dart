import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'package:proypet/src/services/user_provider.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // _LoginStore() { autorun((_) {}); }

  UserDato userModel = UserDato();
  final loginProvider = UserProvider();
  final _prefs = new PreferenciasUsuario();

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

  @computed
  bool get isEmailValid => email.trim().length > 0;

  @computed
  bool get isPasswordValid => password.trim().length > 0;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

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
