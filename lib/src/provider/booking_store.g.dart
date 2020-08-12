// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookingStore on _BookingStoreBase, Store {
  Computed<bool> _$sinAtencionesComputed;

  @override
  bool get sinAtenciones =>
      (_$sinAtencionesComputed ??= Computed<bool>(() => super.sinAtenciones,
              name: '_BookingStoreBase.sinAtenciones'))
          .value;

  final _$atencionesAtom = Atom(name: '_BookingStoreBase.atenciones');

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

  final _$deleteBookingAsyncAction =
      AsyncAction('_BookingStoreBase.deleteBooking');

  @override
  Future<void> deleteBooking(dynamic id) {
    return _$deleteBookingAsyncAction.run(() => super.deleteBooking(id));
  }

  final _$_BookingStoreBaseActionController =
      ActionController(name: '_BookingStoreBase');

  @override
  void eliminaAtencion(dynamic id) {
    final _$actionInfo = _$_BookingStoreBaseActionController.startAction(
        name: '_BookingStoreBase.eliminaAtencion');
    try {
      return super.eliminaAtencion(id);
    } finally {
      _$_BookingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
atenciones: ${atenciones},
sinAtenciones: ${sinAtenciones}
    ''';
  }
}
