import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'package:proypet/src/providers/user_provider.dart';

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

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  UserDato userModel = UserDato();
  final loginProvider = UserProvider();

  @action
  void getLogin() {
    login();
  }

  @action
  Future login() async {
    loading = true;
    // await Future.delayed(Duration(seconds: 1));
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
}
