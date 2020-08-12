// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$hasEmailDataComputed;

  @override
  bool get hasEmailData =>
      (_$hasEmailDataComputed ??= Computed<bool>(() => super.hasEmailData,
              name: '_LoginStore.hasEmailData'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;
  Computed<bool> _$formCompleteComputed;

  @override
  bool get formComplete =>
      (_$formCompleteComputed ??= Computed<bool>(() => super.formComplete,
              name: '_LoginStore.formComplete'))
          .value;
  Computed<bool> _$hasTokenComputed;

  @override
  bool get hasToken => (_$hasTokenComputed ??=
          Computed<bool>(() => super.hasToken, name: '_LoginStore.hasToken'))
      .value;
  Computed<bool> _$isVerifyComputed;

  @override
  bool get isVerify => (_$isVerifyComputed ??=
          Computed<bool>(() => super.isVerify, name: '_LoginStore.isVerify'))
      .value;

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$nombreAtom = Atom(name: '_LoginStore.nombre');

  @override
  String get nombre {
    _$nombreAtom.reportRead();
    return super.nombre;
  }

  @override
  set nombre(String value) {
    _$nombreAtom.reportWrite(value, super.nombre, () {
      super.nombre = value;
    });
  }

  final _$apellidoAtom = Atom(name: '_LoginStore.apellido');

  @override
  String get apellido {
    _$apellidoAtom.reportRead();
    return super.apellido;
  }

  @override
  set apellido(String value) {
    _$apellidoAtom.reportWrite(value, super.apellido, () {
      super.apellido = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_LoginStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$respLoginAtom = Atom(name: '_LoginStore.respLogin');

  @override
  Map<String, dynamic> get respLogin {
    _$respLoginAtom.reportRead();
    return super.respLogin;
  }

  @override
  set respLogin(Map<String, dynamic> value) {
    _$respLoginAtom.reportWrite(value, super.respLogin, () {
      super.respLogin = value;
    });
  }

  final _$rutaInicioAtom = Atom(name: '_LoginStore.rutaInicio');

  @override
  String get rutaInicio {
    _$rutaInicioAtom.reportRead();
    return super.rutaInicio;
  }

  @override
  set rutaInicio(String value) {
    _$rutaInicioAtom.reportWrite(value, super.rutaInicio, () {
      super.rutaInicio = value;
    });
  }

  final _$passwordVisibleAtom = Atom(name: '_LoginStore.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$evaluaLoginAsyncAction = AsyncAction('_LoginStore.evaluaLogin');

  @override
  Future<void> evaluaLogin() {
    return _$evaluaLoginAsyncAction.run(() => super.evaluaLogin());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNombre(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setNombre');
    try {
      return super.setNombre(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApellido(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setApellido');
    try {
      return super.setApellido(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passNotVisible() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.passNotVisible');
    try {
      return super.passNotVisible();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeSingUp() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.disposeSingUp');
    try {
      return super.disposeSingUp();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getLogin() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.getLogin');
    try {
      return super.getLogin();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void olvideClave() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.olvideClave');
    try {
      return super.olvideClave();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void registraUser() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.registraUser');
    try {
      return super.registraUser();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void evaluaIngreso() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.evaluaIngreso');
    try {
      return super.evaluaIngreso();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
nombre: ${nombre},
apellido: ${apellido},
loading: ${loading},
loggedIn: ${loggedIn},
respLogin: ${respLogin},
rutaInicio: ${rutaInicio},
passwordVisible: ${passwordVisible},
hasEmailData: ${hasEmailData},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid},
formComplete: ${formComplete},
hasToken: ${hasToken},
isVerify: ${isVerify}
    ''';
  }
}
