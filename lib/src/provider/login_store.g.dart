// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
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

  final _$evaluaLoginAsyncAction = AsyncAction('_LoginStore.evaluaLogin');

  @override
  Future<void> evaluaLogin() {
    return _$evaluaLoginAsyncAction.run(() => super.evaluaLogin());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

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
rutaInicio: ${rutaInicio},
hasToken: ${hasToken},
isVerify: ${isVerify}
    ''';
  }
}
