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
  Computed<bool> _$sinDatosComputed;

  @override
  bool get sinDatos => (_$sinDatosComputed ??=
          Computed<bool>(() => super.sinDatos, name: '_HomeStore.sinDatos'))
      .value;
  Computed<bool> _$sinNombreMascotaComputed;

  @override
  bool get sinNombreMascota => (_$sinNombreMascotaComputed ??= Computed<bool>(
          () => super.sinNombreMascota,
          name: '_HomeStore.sinNombreMascota'))
      .value;
  Computed<bool> _$sinFechaMascotaComputed;

  @override
  bool get sinFechaMascota =>
      (_$sinFechaMascotaComputed ??= Computed<bool>(() => super.sinFechaMascota,
              name: '_HomeStore.sinFechaMascota'))
          .value;
  Computed<bool> _$sinMascotasComputed;

  @override
  bool get sinMascotas =>
      (_$sinMascotasComputed ??= Computed<bool>(() => super.sinMascotas,
              name: '_HomeStore.sinMascotas'))
          .value;
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

  final _$miPetAtom = Atom(name: '_HomeStore.miPet');

  @override
  PetModel get miPet {
    _$miPetAtom.reportRead();
    return super.miPet;
  }

  @override
  set miPet(PetModel value) {
    _$miPetAtom.reportWrite(value, super.miPet, () {
      super.miPet = value;
    });
  }

  final _$miMascotaAtom = Atom(name: '_HomeStore.miMascota');

  @override
  MascotaModel get miMascota {
    _$miMascotaAtom.reportRead();
    return super.miMascota;
  }

  @override
  set miMascota(MascotaModel value) {
    _$miMascotaAtom.reportWrite(value, super.miMascota, () {
      super.miMascota = value;
    });
  }

  final _$cargandoMiPetAtom = Atom(name: '_HomeStore.cargandoMiPet');

  @override
  bool get cargandoMiPet {
    _$cargandoMiPetAtom.reportRead();
    return super.cargandoMiPet;
  }

  @override
  set cargandoMiPet(bool value) {
    _$cargandoMiPetAtom.reportWrite(value, super.cargandoMiPet, () {
      super.cargandoMiPet = value;
    });
  }

  final _$mascotaIdpetAtom = Atom(name: '_HomeStore.mascotaIdpet');

  @override
  String get mascotaIdpet {
    _$mascotaIdpetAtom.reportRead();
    return super.mascotaIdpet;
  }

  @override
  set mascotaIdpet(String value) {
    _$mascotaIdpetAtom.reportWrite(value, super.mascotaIdpet, () {
      super.mascotaIdpet = value;
    });
  }

  final _$mascotaNombreAtom = Atom(name: '_HomeStore.mascotaNombre');

  @override
  String get mascotaNombre {
    _$mascotaNombreAtom.reportRead();
    return super.mascotaNombre;
  }

  @override
  set mascotaNombre(String value) {
    _$mascotaNombreAtom.reportWrite(value, super.mascotaNombre, () {
      super.mascotaNombre = value;
    });
  }

  final _$fechaMascotaAtom = Atom(name: '_HomeStore.fechaMascota');

  @override
  String get fechaMascota {
    _$fechaMascotaAtom.reportRead();
    return super.fechaMascota;
  }

  @override
  set fechaMascota(String value) {
    _$fechaMascotaAtom.reportWrite(value, super.fechaMascota, () {
      super.fechaMascota = value;
    });
  }

  final _$especieMascotaIDAtom = Atom(name: '_HomeStore.especieMascotaID');

  @override
  int get especieMascotaID {
    _$especieMascotaIDAtom.reportRead();
    return super.especieMascotaID;
  }

  @override
  set especieMascotaID(int value) {
    _$especieMascotaIDAtom.reportWrite(value, super.especieMascotaID, () {
      super.especieMascotaID = value;
    });
  }

  final _$razaMascotaIDAtom = Atom(name: '_HomeStore.razaMascotaID');

  @override
  int get razaMascotaID {
    _$razaMascotaIDAtom.reportRead();
    return super.razaMascotaID;
  }

  @override
  set razaMascotaID(int value) {
    _$razaMascotaIDAtom.reportWrite(value, super.razaMascotaID, () {
      super.razaMascotaID = value;
    });
  }

  final _$generoMascotaAtom = Atom(name: '_HomeStore.generoMascota');

  @override
  int get generoMascota {
    _$generoMascotaAtom.reportRead();
    return super.generoMascota;
  }

  @override
  set generoMascota(int value) {
    _$generoMascotaAtom.reportWrite(value, super.generoMascota, () {
      super.generoMascota = value;
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

  final _$refreshAsyncAction = AsyncAction('_HomeStore.refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$summaryAsyncAction = AsyncAction('_HomeStore.summary');

  @override
  Future<void> summary() {
    return _$summaryAsyncAction.run(() => super.summary());
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
  void eliminaAtencionToHome(dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.eliminaAtencionToHome');
    try {
      return super.eliminaAtencionToHome(id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detalleReservado(dynamic atencion) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.detalleReservado');
    try {
      return super.detalleReservado(atencion);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reservarGo() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.reservarGo');
    try {
      return super.reservarGo();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaIdPet(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaIdPet');
    try {
      return super.setMascotaIdPet(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaNombre(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaNombre');
    try {
      return super.setMascotaNombre(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaFecha(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaFecha');
    try {
      return super.setMascotaFecha(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaEspecie(int value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaEspecie');
    try {
      return super.setMascotaEspecie(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaRaza(int value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaRaza');
    try {
      return super.setMascotaRaza(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMascotaGenero(int value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMascotaGenero');
    try {
      return super.setMascotaGenero(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verMiMascota(dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.verMiMascota');
    try {
      return super.verMiMascota(id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mascotaAdd(dynamic foto) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.mascotaAdd');
    try {
      return super.mascotaAdd(foto);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mascotaEdit(dynamic foto) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.mascotaEdit');
    try {
      return super.mascotaEdit(foto);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void eliminaMascota(dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.eliminaMascota');
    try {
      return super.eliminaMascota(id);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void falleceMascota(MascotaModel mascota, bool fallecido) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.falleceMascota');
    try {
      return super.falleceMascota(mascota, fallecido);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void agregarMascota() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.agregarMascota');
    try {
      return super.agregarMascota();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detalleMascota(dynamic id) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.detalleMascota');
    try {
      return super.detalleMascota(id);
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
atenciones: ${atenciones},
mascotas: ${mascotas},
miPet: ${miPet},
miMascota: ${miMascota},
cargandoMiPet: ${cargandoMiPet},
mascotaIdpet: ${mascotaIdpet},
mascotaNombre: ${mascotaNombre},
fechaMascota: ${fechaMascota},
especieMascotaID: ${especieMascotaID},
razaMascotaID: ${razaMascotaID},
generoMascota: ${generoMascota},
fecha: ${fecha},
hora: ${hora},
establecimientoId: ${establecimientoId},
mascotaId: ${mascotaId},
reservaId: ${reservaId},
observacion: ${observacion},
conDelivery: ${conDelivery},
deliveryTipo: ${deliveryTipo},
deliveryDireccion: ${deliveryDireccion},
sinAtenciones: ${sinAtenciones},
sinDatos: ${sinDatos},
sinNombreMascota: ${sinNombreMascota},
sinFechaMascota: ${sinFechaMascota},
sinMascotas: ${sinMascotas},
fechaTime: ${fechaTime},
fechaTimeAt: ${fechaTimeAt},
hasFechaHora: ${hasFechaHora},
isDateOk: ${isDateOk},
hasDelivery: ${hasDelivery},
isDeliveryOk: ${isDeliveryOk}
    ''';
  }
}
