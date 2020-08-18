// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<DateTime> _$fechaTimeComputed;

  @override
  DateTime get fechaTime =>
      (_$fechaTimeComputed ??= Computed<DateTime>(() => super.fechaTime,
              name: '_HomeStore.fechaTime'))
          .value;
  Computed<String> _$fechaTimeAtComputed;

  @override
  String get fechaTimeAt =>
      (_$fechaTimeAtComputed ??= Computed<String>(() => super.fechaTimeAt,
              name: '_HomeStore.fechaTimeAt'))
          .value;
  Computed<bool> _$hasFechaHoraComputed;

  @override
  bool get hasFechaHora =>
      (_$hasFechaHoraComputed ??= Computed<bool>(() => super.hasFechaHora,
              name: '_HomeStore.hasFechaHora'))
          .value;
  Computed<bool> _$isDateOkComputed;

  @override
  bool get isDateOk => (_$isDateOkComputed ??=
          Computed<bool>(() => super.isDateOk, name: '_HomeStore.isDateOk'))
      .value;
  Computed<bool> _$hasDeliveryComputed;

  @override
  bool get hasDelivery =>
      (_$hasDeliveryComputed ??= Computed<bool>(() => super.hasDelivery,
              name: '_HomeStore.hasDelivery'))
          .value;
  Computed<bool> _$isDeliveryOkComputed;

  @override
  bool get isDeliveryOk =>
      (_$isDeliveryOkComputed ??= Computed<bool>(() => super.isDeliveryOk,
              name: '_HomeStore.isDeliveryOk'))
          .value;

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

  final _$fechaAtom = Atom(name: '_HomeStore.fecha');

  @override
  String get fecha {
    _$fechaAtom.reportRead();
    return super.fecha;
  }

  @override
  set fecha(String value) {
    _$fechaAtom.reportWrite(value, super.fecha, () {
      super.fecha = value;
    });
  }

  final _$horaAtom = Atom(name: '_HomeStore.hora');

  @override
  String get hora {
    _$horaAtom.reportRead();
    return super.hora;
  }

  @override
  set hora(String value) {
    _$horaAtom.reportWrite(value, super.hora, () {
      super.hora = value;
    });
  }

  final _$establecimientoIdAtom = Atom(name: '_HomeStore.establecimientoId');

  @override
  String get establecimientoId {
    _$establecimientoIdAtom.reportRead();
    return super.establecimientoId;
  }

  @override
  set establecimientoId(String value) {
    _$establecimientoIdAtom.reportWrite(value, super.establecimientoId, () {
      super.establecimientoId = value;
    });
  }

  final _$mascotaIdAtom = Atom(name: '_HomeStore.mascotaId');

  @override
  String get mascotaId {
    _$mascotaIdAtom.reportRead();
    return super.mascotaId;
  }

  @override
  set mascotaId(String value) {
    _$mascotaIdAtom.reportWrite(value, super.mascotaId, () {
      super.mascotaId = value;
    });
  }

  final _$reservaIdAtom = Atom(name: '_HomeStore.reservaId');

  @override
  String get reservaId {
    _$reservaIdAtom.reportRead();
    return super.reservaId;
  }

  @override
  set reservaId(String value) {
    _$reservaIdAtom.reportWrite(value, super.reservaId, () {
      super.reservaId = value;
    });
  }

  final _$observacionAtom = Atom(name: '_HomeStore.observacion');

  @override
  String get observacion {
    _$observacionAtom.reportRead();
    return super.observacion;
  }

  @override
  set observacion(String value) {
    _$observacionAtom.reportWrite(value, super.observacion, () {
      super.observacion = value;
    });
  }

  final _$conDeliveryAtom = Atom(name: '_HomeStore.conDelivery');

  @override
  bool get conDelivery {
    _$conDeliveryAtom.reportRead();
    return super.conDelivery;
  }

  @override
  set conDelivery(bool value) {
    _$conDeliveryAtom.reportWrite(value, super.conDelivery, () {
      super.conDelivery = value;
    });
  }

  final _$deliveryTipoAtom = Atom(name: '_HomeStore.deliveryTipo');

  @override
  String get deliveryTipo {
    _$deliveryTipoAtom.reportRead();
    return super.deliveryTipo;
  }

  @override
  set deliveryTipo(String value) {
    _$deliveryTipoAtom.reportWrite(value, super.deliveryTipo, () {
      super.deliveryTipo = value;
    });
  }

  final _$deliveryDireccionAtom = Atom(name: '_HomeStore.deliveryDireccion');

  @override
  String get deliveryDireccion {
    _$deliveryDireccionAtom.reportRead();
    return super.deliveryDireccion;
  }

  @override
  set deliveryDireccion(String value) {
    _$deliveryDireccionAtom.reportWrite(value, super.deliveryDireccion, () {
      super.deliveryDireccion = value;
    });
  }

  final _$esperaAsyncAction = AsyncAction('_HomeStore.espera');

  @override
  Future<Null> espera() {
    return _$esperaAsyncAction.run(() => super.espera());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setStopLoading() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setStopLoading');
    try {
      return super.setStopLoading();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void volver() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.volver');
    try {
      return super.volver();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFecha(String value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setFecha');
    try {
      return super.setFecha(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHora(String value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setHora');
    try {
      return super.setHora(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstablecimiento(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setEstablecimiento');
    try {
      return super.setEstablecimiento(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPetReserva(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setPetReserva');
    try {
      return super.setPetReserva(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReserva(String value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setReserva');
    try {
      return super.setReserva(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservacion(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setObservacion');
    try {
      return super.setObservacion(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConDelivery(bool value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setConDelivery');
    try {
      return super.setConDelivery(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDelivery(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setDelivery');
    try {
      return super.setDelivery(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDireccion(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setDireccion');
    try {
      return super.setDireccion(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reservarAtencion() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.reservarAtencion');
    try {
      return super.reservarAtencion();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
loading: ${loading},
fecha: ${fecha},
hora: ${hora},
establecimientoId: ${establecimientoId},
mascotaId: ${mascotaId},
reservaId: ${reservaId},
observacion: ${observacion},
conDelivery: ${conDelivery},
deliveryTipo: ${deliveryTipo},
deliveryDireccion: ${deliveryDireccion},
fechaTime: ${fechaTime},
fechaTimeAt: ${fechaTimeAt},
hasFechaHora: ${hasFechaHora},
isDateOk: ${isDateOk},
hasDelivery: ${hasDelivery},
isDeliveryOk: ${isDeliveryOk}
    ''';
  }
}
