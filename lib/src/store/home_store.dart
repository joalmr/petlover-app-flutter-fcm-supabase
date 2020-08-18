import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/booking/booking_model.dart';
import 'package:proypet/src2/data/services/booking_service.dart';
import 'package:proypet/src2/data/services/mascota_service.dart';
import 'package:proypet/src2/utils/add_msg.dart';
import 'package:proypet/src2/app/styles/styles.dart';

import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/app/views/components/thx_page.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String usuario = '';

  @observable
  bool loading = true;

  final bookingProvider = BookingService();
//////////////////////////////////////////////////////

  /* funciones comunes */
  @action
  void setStopLoading() => loading = false;

  @action
  Future<Null> espera() async {
    await Future.delayed(Duration(milliseconds: 9));
    loading = false;
  }

  @action
  void volver() {
    // volverVoid();
    Get.back();
  }

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

  /* reservar */
  @observable
  String fecha = '';

  @action
  void setFecha(String value) => fecha = value;

  @observable
  String hora = '';

  @action
  void setHora(String value) => hora = value;

  @observable
  String establecimientoId = '';

  @action
  void setEstablecimiento(String value) => establecimientoId = value; //falta

  @observable
  String mascotaId = '';

  //para reservar
  @action
  void setPetReserva(String value) => mascotaId = value; //poner en init

  @observable
  String reservaId = '';

  @action
  void setReserva(String value) => reservaId = value;

  @observable
  String observacion = '';

  @action
  void setObservacion(String value) => observacion = value;

  @observable
  bool conDelivery = false;

  @action
  void setConDelivery(bool value) => conDelivery = value; //falta

  @observable
  String deliveryTipo = '';

  @action
  void setDelivery(String value) => deliveryTipo = value;

  @observable
  String deliveryDireccion = '';

  @action
  void setDireccion(String value) => deliveryDireccion = value;
  /* fin reservar */

  @computed
  DateTime get fechaTime => DateTime.parse(fecha + " " + hora);

  @computed
  String get fechaTimeAt => DateFormat('yyyy-MM-dd kk:mm:ss').format(fechaTime);

  @computed
  bool get hasFechaHora => fecha.trim().isEmpty || hora.trim().isEmpty;

  @computed
  bool get isDateOk {
    bool respuesta = true;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print(formattedDate);
    print(fechaTimeAt.split(' ')[0]);
    print(fechaTime.hour);
    if (formattedDate == fechaTimeAt.split(' ')[0] && fechaTime.hour < (now.hour - 1)) {
      respuesta = false;
    }
    return respuesta;
  }

  @computed
  bool get hasDelivery => conDelivery && deliveryTipo != '';

  @computed
  bool get isDeliveryOk => conDelivery && deliveryTipo != '' && deliveryDireccion.trim().isNotEmpty;
  // '' quiza en vez de null

  @action
  void reservarAtencion() {
    reservarBooking();
  }

  void reservarBooking() {
    if (hasFechaHora) {
      //bla bla
      mostrarSnackbar('Debe ingresar fecha y hora de la reserva', colorRed);
    } else {
      if (!isDateOk) {
        //bla bla
        mostrarSnackbar('La hora debe ser mayor', colorRed);
      } else {
        if (hasDelivery) {
          if (!isDeliveryOk) {
            //blabla
            mostrarSnackbar('Debe ingresar la dirección para el servicio de movilidad', colorRed);
          } else {
            ejecutaReserva();
          }
        } else {
          ejecutaReserva();
        }
      }
    }
  }

  Future<void> ejecutaReserva() async {
    BookingModel booking = BookingModel();
    booking.bookingAt = fechaTimeAt;
    booking.establishmentId = establecimientoId;
    booking.petId = mascotaId; //
    booking.typeId = reservaId;
    booking.observation = observacion;
    bool resp = await bookingProvider.booking(booking, deliveryTipo, deliveryDireccion);
    if (resp) {
      // getSummary();
      MascotaService()
          .getPet(mascotaId)
          .then((value) => Get.to(ThxPage(CachedNetworkImageProvider(value.pet.picture), thxReserva[Random().nextInt(thxReserva.length)])));
    }
  }
//////////////////////////////////////////////////////

}
