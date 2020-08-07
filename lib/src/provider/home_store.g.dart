// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool> _$sinAtencionesComputed;

  @override
  bool get sinAtenciones =>
      (_$sinAtencionesComputed ??= Computed<bool>(() => super.sinAtenciones,
              name: '_HomeStore.sinAtenciones'))
          .value;
  Computed<bool> _$sinMascotasComputed;

  @override
  bool get sinMascotas =>
      (_$sinMascotasComputed ??= Computed<bool>(() => super.sinMascotas,
              name: '_HomeStore.sinMascotas'))
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

  final _$mascotasAtom = Atom(name: '_HomeStore.mascotas');

  @override
  ObservableList<MascotaModel> get mascotas {
    _$mascotasAtom.reportRead();
    return super.mascotas;
  }

  @override
  set mascotas(ObservableList<MascotaModel> value) {
    _$mascotasAtom.reportWrite(value, super.mascotas, () {
      super.mascotas = value;
    });
  }

  final _$atencionesAtom = Atom(name: '_HomeStore.atenciones');

  @override
  ObservableList<BookingHome> get atenciones {
    _$atencionesAtom.reportRead();
    return super.atenciones;
  }

  @override
  set atenciones(ObservableList<BookingHome> value) {
    _$atencionesAtom.reportWrite(value, super.atenciones, () {
      super.atenciones = value;
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

  final _$summaryAsyncAction = AsyncAction('_HomeStore.summary');

  @override
  Future<void> summary() {
    return _$summaryAsyncAction.run(() => super.summary());
  }

  final _$userAsyncAction = AsyncAction('_HomeStore.user');

  @override
  Future<void> user() {
    return _$userAsyncAction.run(() => super.user());
  }

  final _$petsAsyncAction = AsyncAction('_HomeStore.pets');

  @override
  Future<void> pets() {
    return _$petsAsyncAction.run(() => super.pets());
  }

  final _$bookingsAsyncAction = AsyncAction('_HomeStore.bookings');

  @override
  Future<void> bookings() {
    return _$bookingsAsyncAction.run(() => super.bookings());
  }

  final _$refreshAsyncAction = AsyncAction('_HomeStore.refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$deleteBookingAsyncAction = AsyncAction('_HomeStore.deleteBooking');

  @override
  Future<void> deleteBooking(dynamic id) {
    return _$deleteBookingAsyncAction.run(() => super.deleteBooking(id));
  }

  final _$volverVoidAsyncAction = AsyncAction('_HomeStore.volverVoid');

  @override
  Future<void> volverVoid(BuildContext context) {
    return _$volverVoidAsyncAction.run(() => super.volverVoid(context));
  }

  final _$reservaVoidAsyncAction = AsyncAction('_HomeStore.reservaVoid');

  @override
  Future<void> reservaVoid(BuildContext context) {
    return _$reservaVoidAsyncAction.run(() => super.reservaVoid(context));
  }

  final _$agregarMascotaVoidAsyncAction =
      AsyncAction('_HomeStore.agregarMascotaVoid');

  @override
  Future<void> agregarMascotaVoid(BuildContext context) {
    return _$agregarMascotaVoidAsyncAction
        .run(() => super.agregarMascotaVoid(context));
  }

  final _$detalleMascotaVoidAsyncAction =
      AsyncAction('_HomeStore.detalleMascotaVoid');

  @override
  Future<void> detalleMascotaVoid(BuildContext context, dynamic id) {
    return _$detalleMascotaVoidAsyncAction
        .run(() => super.detalleMascotaVoid(context, id));
  }

  final _$detalleReservadoVoidAsyncAction =
      AsyncAction('_HomeStore.detalleReservadoVoid');

  @override
  Future<void> detalleReservadoVoid(BuildContext context, dynamic atencion) {
    return _$detalleReservadoVoidAsyncAction
        .run(() => super.detalleReservadoVoid(context, atencion));
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
  void eliminaAtencion(BuildContext context, dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.eliminaAtencion');
    try {
      return super.eliminaAtencion(context, id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void volver(BuildContext context) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.volver');
    try {
      return super.volver(context);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reservar(BuildContext context) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.reservar');
    try {
      return super.reservar(context);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void agregarMascota(BuildContext context) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.agregarMascota');
    try {
      return super.agregarMascota(context);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detalleMascota(BuildContext context, dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.detalleMascota');
    try {
      return super.detalleMascota(context, id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detalleReservado(BuildContext context, dynamic atencion) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.detalleReservado');
    try {
      return super.detalleReservado(context, atencion);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
mascotas: ${mascotas},
atenciones: ${atenciones},
loading: ${loading},
sinAtenciones: ${sinAtenciones},
sinMascotas: ${sinMascotas}
    ''';
  }
}
