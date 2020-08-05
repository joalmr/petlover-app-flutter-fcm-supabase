// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$usuarioAtom = Atom(name: '_HomeStore.usuario');

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

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

  final _$esperaAsyncAction = AsyncAction('_HomeStore.espera');

  @override
  Future<Null> espera() {
    return _$esperaAsyncAction.run(() => super.espera());
  }

  final _$userAsyncAction = AsyncAction('_HomeStore.user');

  @override
  Future<dynamic> user() {
    return _$userAsyncAction.run(() => super.user());
  }

  final _$petsAsyncAction = AsyncAction('_HomeStore.pets');

  @override
  Future<dynamic> pets() {
    return _$petsAsyncAction.run(() => super.pets());
  }

  final _$bookingsAsyncAction = AsyncAction('_HomeStore.bookings');

  @override
  Future<dynamic> bookings() {
    return _$bookingsAsyncAction.run(() => super.bookings());
  }

  final _$refreshAsyncAction = AsyncAction('_HomeStore.refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$deleteBookingAsyncAction = AsyncAction('_HomeStore.deleteBooking');

  @override
  Future<dynamic> deleteBooking(dynamic id) {
    return _$deleteBookingAsyncAction.run(() => super.deleteBooking(id));
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void getSummary() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.getSummary');
    try {
      return super.getSummary();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void eliminaAtencion(dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.eliminaAtencion');
    try {
      return super.eliminaAtencion(id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
loading: ${loading}
    ''';
  }
}
