import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
// import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/models/booking/booking_model.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/models/mascota/pet_model.dart';
import 'package:proypet/src2/data/services/booking_service.dart';
import 'package:proypet/src2/data/services/mascota_service.dart';
// import 'package:proypet/src/services/user_provider.dart';
// import 'package:proypet/src2/data/services/summary_service.dart';
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

  // @action
  // Future<void> volverVoid() async {
  //   Get.back();
  // }
  /* fin comunes */

//////////////////////////////////////////////////////

  /* funciones iniciales */
  // @action
  // Future<Null> refresh() async {
  //   await Future.delayed(Duration(milliseconds: 2));
  //   getSummary();
  //   return null;
  // }

  // @action
  // void getSummary() {
  //   summary();
  //   espera();
  // }

  // @action
  // Future<void> summary() async {
  //   var resp = await SummaryService().getUserSummary();
  //   usuario = resp.user.name; //usuario
  //   mascotas.clear(); //mascotas
  //   mascotas.addAll(resp.pets);
  //   atenciones.clear(); //atenciones
  //   DateTime now = DateTime.now();
  //   resp.bookings.forEach((booking) {
  //     var fechaAt = booking.date.split('-');
  //     bool vencido = false;
  //     if (int.parse(fechaAt[0]) < now.day && int.parse(fechaAt[1]) == now.month && int.parse(fechaAt[2]) == now.year) {
  //       vencido = true;
  //     }
  //     booking.vencido = vencido;
  //     atenciones.add(booking);
  //   });
  // }
  /* fin iniciales */

//////////////////////////////////////////////////////

  /* atenciones */
  // @observable
  // ObservableList<BookingHome> atenciones = ObservableList<BookingHome>();

  final bookingProvider = BookingService();

  // @computed
  // bool get sinAtenciones => atenciones.length == 0;

  // @action
  // void eliminaAtencion(id) {
  //   deleteBooking(id);
  //   loading = false;
  //   volver();
  // }

  // Future<void> deleteBooking(id) async {
  //   var resp = await bookingProvider.deleteBooking(id);
  //   if (resp) {
  //     getSummary();
  //   }
  // }

  @action
  void eliminaAtencionToHome(id) {
    deleteBookingToHome(id);
    loading = false;
  }

  Future<void> deleteBookingToHome(id) async {
    var resp = await bookingProvider.deleteBooking(id);
    print('elimina..');
    print(resp);
    if (resp) {
      // getSummary();
      await Get.offAllNamed('navInicio');
    } else {
      mostrarSnackbar("No se eliminó la atención", colorRed);
    }
  }

  // @action
  // void detalleReservado(atencion) {
  //   detalleReservadoVoid(atencion);
  // }

  // Future<void> detalleReservadoVoid(atencion) async {
  //   await Get.toNamed('detallereservado', arguments: atencion);
  // }

  // @action
  // void reservarGo() {
  //   reservaVoid();
  // }

  // Future<void> reservaVoid() async {
  //   await Get.toNamed('navLista');
  // }
  /* fin atenciones */

//////////////////////////////////////////////////////

  /* mascotas */
  @observable
  ObservableList<MascotaModel> mascotas = ObservableList<MascotaModel>();

  @observable
  PetModel miPet = PetModel();

  @observable
  MascotaModel miMascota = MascotaModel();

  @observable
  bool cargandoMiPet = true;

  @observable
  String mascotaIdpet = '';
  @action
  void setMascotaIdPet(String value) => mascotaIdpet = value;

  @observable
  String mascotaNombre = '';
  @action
  void setMascotaNombre(String value) => mascotaNombre = value;

  @observable
  String fechaMascota = '';
  @action
  void setMascotaFecha(String value) => fechaMascota = value;

  @observable
  int especieMascotaID;
  @action
  void setMascotaEspecie(int value) => especieMascotaID = value;

  @observable
  int razaMascotaID;
  @action
  void setMascotaRaza(int value) => razaMascotaID = value;

  @observable
  int generoMascota;
  @action
  void setMascotaGenero(int value) => generoMascota = value;

  @computed
  bool get sinDatos => mascotaNombre.trim().isEmpty && fechaMascota.trim().isEmpty;

  @computed
  bool get sinNombreMascota => mascotaNombre.trim().isEmpty && fechaMascota.trim().isNotEmpty;

  @computed
  bool get sinFechaMascota => mascotaNombre.trim().isNotEmpty && fechaMascota.trim().isEmpty;

  final mascotaProvider = new MascotaService();

  @action
  void verMiMascota(id) {
    verMiMascotaVoid(id);
  }

  Future<void> verMiMascotaVoid(id) async {
    miPet = await mascotaProvider.getPet(id);
    miMascota = miPet.pet;
    await Future.delayed(Duration(milliseconds: 9));
    cargandoMiPet = false;
  }

  @action
  void mascotaAdd(foto) {
    mascotaAddVoid(foto);
  }

  Future<void> mascotaAddVoid(foto) async {
    if (sinDatos) {
      mostrarSnackbar('Ingrese datos de la mascota.', colorRed);
    } else if (sinNombreMascota || sinFechaMascota) {
      if (sinNombreMascota) mostrarSnackbar('Ingrese nombre de la mascota.', colorRed);
      if (sinFechaMascota) mostrarSnackbar('Ingrese nacimiento de la mascota.', colorRed);
    } else {
      MascotaModel mascotaData = new MascotaModel();
      mascotaData.name = mascotaNombre;
      mascotaData.birthdate = fechaMascota;
      mascotaData.genre = generoMascota;
      mascotaData.specieId = especieMascotaID;
      mascotaData.breedId = razaMascotaID;

      Map resp = await mascotaProvider.savePet(mascotaData, foto);
      if (resp['ok']) {
        // getSummary();
        await Get.to(ThxPage(CachedNetworkImageProvider(resp['petImg']), thxPet[Random().nextInt(thxPet.length)]));
      } else {
        mostrarSnackbar('Oops, intentalo más tarde.', colorRed);
      }
    }
  }

  @action
  void mascotaEdit(foto) {
    mascotaEditVoid(foto);
  }

  Future<void> mascotaEditVoid(foto) async {
    if (sinDatos) {
      mostrarSnackbar('Ingrese datos de la mascota.', colorRed);
    } else if (sinNombreMascota || sinFechaMascota) {
      if (sinNombreMascota) mostrarSnackbar('Ingrese nombre de la mascota.', colorRed);
      if (sinFechaMascota) mostrarSnackbar('Ingrese nacimiento de la mascota.', colorRed);
    } else {
      MascotaModel mascotaData = new MascotaModel();
      mascotaData.id = mascotaIdpet;
      mascotaData.name = mascotaNombre;
      mascotaData.birthdate = fechaMascota;
      mascotaData.genre = generoMascota;
      mascotaData.specieId = especieMascotaID;
      mascotaData.breedId = razaMascotaID;
      // print(mascotaData);
      bool resp = await mascotaProvider.editPet(mascotaData, foto);
      if (resp) {
        verMiMascota(mascotaData.id);
        // getSummary();
        Get.back();
        Get.back();
      } else {
        mostrarSnackbar('Oops, intentalo más tarde.', colorRed);
      }
    }
  }

  @action
  void eliminaMascota(id) {
    eliminaMascotaVoid(id);
  }

  Future<void> eliminaMascotaVoid(id) async {
    bool resp = await mascotaProvider.deletePet(id);
    if (resp) {
      // getSummary();
      Get.offAllNamed('navInicio');
    } else
      Get.back();
  }

  // @action
  // void falleceMascota(MascotaModel mascota, bool fallecido) {
  //   mascota.status = 0;
  //   if (!fallecido) {
  //     mascota.status = 1;
  //   }

  //   falleceMascotaVoid(mascota);
  // }

  // Future<void> falleceMascotaVoid(MascotaModel mascota) async {
  //   bool resp = await mascotaProvider.muerePet(mascota);
  //   if (resp) {
  //     verMiMascota(mascota.id);
  //     Get.back();
  //   } else
  //     Get.back();
  // }

////
////
  @computed
  bool get sinMascotas => mascotas.length == 0;

  @action
  void agregarMascota() {
    agregarMascotaVoid();
  }

  Future<void> agregarMascotaVoid() async {
    await Get.toNamed('agregarmascota');
  }

  @action
  void detalleMascota(id) {
    detalleMascotaVoid(id);
  }

  Future<void> detalleMascotaVoid(id) async {
    await Get.toNamed('detallemascota', arguments: id);
  }
  /* fin mascotas */

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
