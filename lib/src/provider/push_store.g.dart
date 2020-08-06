// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PushStore on _PushStore, Store {
  final _$notificacionPushAtom = Atom(name: '_PushStore.notificacionPush');

  @override
  bool get notificacionPush {
    _$notificacionPushAtom.reportRead();
    return super.notificacionPush;
  }

  @override
  set notificacionPush(bool value) {
    _$notificacionPushAtom.reportWrite(value, super.notificacionPush, () {
      super.notificacionPush = value;
    });
  }

  final _$mensajeAtom = Atom(name: '_PushStore.mensaje');

  @override
  Map<String, dynamic> get mensaje {
    _$mensajeAtom.reportRead();
    return super.mensaje;
  }

  @override
  set mensaje(Map<String, dynamic> value) {
    _$mensajeAtom.reportWrite(value, super.mensaje, () {
      super.mensaje = value;
    });
  }

  final _$esperaAsyncAction = AsyncAction('_PushStore.espera');

  @override
  Future<Null> espera() {
    return _$esperaAsyncAction.run(() => super.espera());
  }

  final _$pushVoidAsyncAction = AsyncAction('_PushStore.pushVoid');

  @override
  Future<void> pushVoid(BuildContext context) {
    return _$pushVoidAsyncAction.run(() => super.pushVoid(context));
  }

  final _$_PushStoreActionController = ActionController(name: '_PushStore');

  @override
  void firebase() {
    final _$actionInfo =
        _$_PushStoreActionController.startAction(name: '_PushStore.firebase');
    try {
      return super.firebase();
    } finally {
      _$_PushStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void firebasePermiso() {
    final _$actionInfo = _$_PushStoreActionController.startAction(
        name: '_PushStore.firebasePermiso');
    try {
      return super.firebasePermiso();
    } finally {
      _$_PushStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void firebaseToken() {
    final _$actionInfo = _$_PushStoreActionController.startAction(
        name: '_PushStore.firebaseToken');
    try {
      return super.firebaseToken();
    } finally {
      _$_PushStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void firebaseConfigure() {
    final _$actionInfo = _$_PushStoreActionController.startAction(
        name: '_PushStore.firebaseConfigure');
    try {
      return super.firebaseConfigure();
    } finally {
      _$_PushStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void push(BuildContext context) {
    final _$actionInfo =
        _$_PushStoreActionController.startAction(name: '_PushStore.push');
    try {
      return super.push(context);
    } finally {
      _$_PushStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notificacionPush: ${notificacionPush},
mensaje: ${mensaje}
    ''';
  }
}
