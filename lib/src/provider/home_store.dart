import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/services/booking_provider.dart';
import 'package:proypet/src/services/user_provider.dart';
import 'package:proypet/src/views/pages/viewHome/booking/detalle_reservado.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String usuario = '';

  @observable
  ObservableList<MascotaModel> mascotas = ObservableList<MascotaModel>();

  @observable
  ObservableList<BookingHome> atenciones = ObservableList<BookingHome>();

  @observable
  bool loading = true;

  // final loginProvider = UserProvider();

  @action
  void getSummary() {
    summary();
    print(mascotas);
    print(atenciones);
    loading = false;
    // espera();
  }

  @action
  Future<Null> espera() async {
    await Future.delayed(Duration(milliseconds: 900));
    loading = false;
  }

  // @action
  // Future provider() async {
  //   respService = await UserProvider().getUserSummary();
  // }

  @action
  Future summary() async {
    var resp = await UserProvider().getUserSummary();
    //usuario
    usuario = resp.user.name;
    //mascotas
    mascotas.clear();
    mascotas.addAll(resp.pets);
    //atenciones
    atenciones.clear();
    DateTime now = DateTime.now();
    resp.bookings.forEach((booking) {
      var fechaAt = booking.date.split('-');
      bool vencido = false;
      if (int.parse(fechaAt[0]) < now.day && int.parse(fechaAt[1]) == now.month && int.parse(fechaAt[2]) == now.year) {
        vencido = true;
      }
      booking.vencido = vencido;
      atenciones.add(booking);
    });
  }

  @action
  Future user() async {
    var resp = await UserProvider().getUserSummary();
    usuario = resp.user.name;
  }

  @action
  Future pets() async {
    mascotas.clear();
    var resp = await UserProvider().getUserSummary();
    mascotas.addAll(resp.pets);
  }

  @action
  Future bookings() async {
    var resp = await UserProvider().getUserSummary();
    atenciones.clear();
    DateTime now = DateTime.now();
    resp.bookings.forEach((booking) {
      var fechaAt = booking.date.split('-');
      bool vencido = false;
      if (int.parse(fechaAt[0]) < now.day && int.parse(fechaAt[1]) == now.month && int.parse(fechaAt[2]) == now.year) {
        vencido = true;
      }
      booking.vencido = vencido;
      atenciones.add(booking);
    });
  }

  @action
  Future<Null> refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getSummary();
    return null;
  }

  final bookingProvider = BookingProvider();

  @action
  void eliminaAtencion(BuildContext context, id) {
    deleteBooking(id);
    bookings();
    loading = false;
    volver(context);
  }

  @action
  Future deleteBooking(id) async {
    await bookingProvider.deleteBooking(id);
  }

  @action
  void volver(BuildContext context) {
    volverVoid(context);
  }

  @action
  Future<void> volverVoid(BuildContext context) async {
    Navigator.pop(context);
  }

  @action
  void reservar(BuildContext context) {
    reservaVoid(context);
  }

  @action
  Future<void> reservaVoid(BuildContext context) async {
    Navigator.pushNamed(context, 'navLista');
  }

  @action
  void agregarMascota(BuildContext context) {
    agregarMascotaVoid(context);
  }

  @action
  Future<void> agregarMascotaVoid(BuildContext context) async {
    Navigator.pushNamed(context, 'agregarmascota');
  }

  @action
  void detalleMascota(BuildContext context, id) {
    detalleMascotaVoid(context, id);
  }

  @action
  Future<void> detalleMascotaVoid(BuildContext context, id) async {
    Navigator.pushNamed(context, 'detallemascota', arguments: id);
  }

  @action
  void detalleReservado(BuildContext context, atencion) {
    detalleReservadoVoid(context, atencion);
  }

  @action
  Future<void> detalleReservadoVoid(BuildContext context, atencion) async {
    Navigator.pushNamed(context, 'detallereservado', arguments: atencion);
  }

  @computed
  bool get sinAtenciones => atenciones.length == 0 || atenciones == null;

  @computed
  bool get sinMascotas => mascotas.length == 0;
}
