import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/components/thx_page.dart';
import 'package:proypet/config/variables_globales.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/_global/data/global_repository.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/booking/model/booking_set_model.dart';
import 'package:proypet/source/booking/model/servicio_reserva.dart';
import 'package:proypet/source/mascota/model/pet_model.dart';
import 'package:proypet/source/booking/service/booking_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';
import 'package:proypet/source/veterinarias/data/model/address.dart';
import 'package:proypet/source/veterinarias/data/model/establecimiento_model.dart';
import 'package:proypet/source/veterinarias/domain/data/horario.dart';
import 'package:proypet/source/veterinarias/presentation/view/vet_reserva/components/lista_servicios.dart';
import 'package:proypet/utils/add_msg.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:time_parser/time_parser.dart';
import 'detalle_vet_controller.dart';
import 'validations/reservaVetValidate.dart';

class ReservaVetController extends GetxController {
  final bookingService = BookingService();
  final globalRepo = GlobalRepository();
  final homeC = Get.find<HomeController>();
  final vetdC = Get.find<VetDetalleController>();

  EstablecimientoModel vet;
  List<MascotaModel2> misMascotas;

  ServicioReserva ex3;
  List<ServicioReserva> listaServicio = [];
  List<String> listaReservaId = []; //llenarlo antes de enviar

  bool hasDelivery;

  RxString _deliveryId = '1'.obs;
  RxString _mascotaId = ''.obs;

  RxList<ServicioReserva> servicioReservaLista = <ServicioReserva>[].obs;
  RxString _fecha = ''.obs;
  RxString _observacion = ''.obs;

  RxInt _stepVal = 0.obs;
  set stepVal(int value) => _stepVal.value = value;
  int get stepVal => _stepVal.value;

  VoidCallback stepContinue;
  VoidCallback stepCancel;

  final inputServController = new TextEditingController();
  final inputObservacioController = new TextEditingController();
  final inputFechaController = new TextEditingController();
  final inputHoraController = new TextEditingController();
  final inputDireccionController = new TextEditingController();

  GoogleMapController _controller;

  final deliveryArray = [
    null,
    'Recojo y entrega a domicilio',
    'Solo recojo a domicilio',
    'Solo entrega a domicilio'
  ];

  final format = DateFormat("yyyy-MM-dd");
  final formatHour = DateFormat("HH:mm");
  // TimeOfDay time = TimeOfDay.now();
  // Duration initialtimer;

  String hora = '';
  String deliveryTipo = '';

  double lat = 0;
  double lng = 0;
  double zoomIn = 10.0;
  RxList<Marker> marcador = <Marker>[].obs;

  RxBool actBtn = true.obs;
  String _mapStyle;

  set mascotaId(String value) => _mascotaId.value = value;
  String get mascotaId => _mascotaId.value;

  set deliveryId(String value) => _deliveryId.value = value;
  String get deliveryId => _deliveryId.value;

  set observacion(String value) => _observacion.value = value;
  String get observacion => _observacion.value;

  set fecha(String value) => _fecha.value = value;
  String get fecha => _fecha.value;

  RxString _textoServicios = ''.obs;
  set textoServicios(String value) => _textoServicios.value = value;
  String get textoServicios => _textoServicios.value;

  TimeOfDay pickedTime;

  @override
  void onInit() {
    super.onInit();
    pickedTime = TimeOfDay.now();

    vet = vetdC.vet;
    iniciales();
    misMascotas = vetdC.misMascotas;
    mascotaId = vetdC.misMascotas.first.id;
    hasDelivery = vetdC.hasDelivery;

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  add2List(numero) {
    if (!listaServicio.contains(numero))
      listaServicio.add(numero);
    else {
      if (listaServicio.length > 1) listaServicio.remove(numero);
    }

    if (listaServicio.length > 1) {
      textoServicios = '';
      listaServicio.forEach((element) {
        textoServicios += '${element.name}, ';
      });
    } else
      textoServicios = listaServicio.first.name;
    update();
  }

  iniciales() {
    serviceInicial();
    fechaHoraInicial();
    direccionInicial();
  }

  serviceInicial() async {
    servicioReservaLista.clear();
    var dato = await bookingService.typeBooking(vet.typeId);
    servicioReservaLista.addAll(dato);

    ex3 = servicioReservaLista.first;
    textoServicios = servicioReservaLista.first.name;
    listaServicio.add(servicioReservaLista.first);
  }

  fechaHoraInicial() {
    String digHora = '';
    String digMin = '';
    pickedTime.hour < 10
        ? digHora = "0${pickedTime.hour}"
        : digHora = pickedTime.hour.toString();
    pickedTime.minute < 10
        ? digMin = "0${pickedTime.minute}"
        : digMin = pickedTime.minute.toString();

    hora = '$digHora:$digMin';

    inputHoraController.text = hora;
    fecha = format.format(DateTime.now());
  }

  direccionInicial() {
    if (prefUser.hasMyAddressLatLng()) {
      lat = double.parse(prefUser.myAddressLatLng.split(',')[0]);
      lng = double.parse(prefUser.myAddressLatLng.split(',')[1]);
      zoomIn = 16.0;

      if (prefUser.hasMyAddress()) {
        inputDireccionController.text = prefUser.myAddress;
      }

      marcador.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(lat, lng),
          draggable: true,
          onDragEnd: ((value) {
            lat = value.latitude;
            lng = value.longitude;
            prefUser.myAddressLatLng = "$lat,$lng";
          }),
        ),
      );
    }
  }

  servicios(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _servicios(context);
  }

  _servicios(context) {
    return Get.dialog(
      serviciosSeleccionados(context),
    );
  }

  void onTimeChanged(TimeOfDay newTime) {
    pickedTime = newTime;
  }

  bool get hasFechaHora => valFechaHora(fecha, hora);
  DateTime get fechaTime => valFechaTime(fecha, hora);
  String get fechaTimeAt => valFechaTimeAt(fechaTime);
  bool get isDateOk => valIsDateOk(fechaTimeAt, fechaTime);
  bool get isDayOk => valIsDayOk(fechaTime, vet);
  bool get isHourOk => valIsHourOk(fechaTime, vet, hora);
  //delivery
  bool get conDelivery => hasDelivery && deliveryId != '1';
  bool get isDeliveryOk =>
      hasDelivery &&
      deliveryId != '1' &&
      inputDireccionController.text.trim() != '';

  String get takeHora {
    int day = fechaTime.weekday;
    var horario = vet.schedule;
    var takeHora = horario[textHorario[day]];
    var time1 = TimeParser.parse(takeHora['time_start']);
    var time2 = TimeParser.parse(takeHora['time_end']);

    return '$time1 - $time2';
  }

  gpsDireccion(Prediction2 data) => _searchandNavigate(data);
  _searchandNavigate(Prediction2 dato) async {
    if (inputDireccionController.text.trim() != "") {
      marcador.clear();

      final datoById = await globalRepo.getLatLngByPlaceId(dato.placeId);
      final location = datoById.result.geometry.location;
      double lat = location.lat;
      double lng = location.lng;
      prefUser.myAddressLatLng = "$lat,$lng";
      inputDireccionController.text = dato.name;
      prefUser.myAddress = dato.name;

      marcador.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(lat, lng),
          draggable: true,
          onDragEnd: ((value) {
            lat = value.latitude;
            lng = value.longitude;
            prefUser.myAddressLatLng = "$lat,$lng";
          }),
        ),
      );
      update(['xmap']);

      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: 16.0,
            bearing: 45.0,
            tilt: 45.0,
          ),
        ),
      );
    }
  }

  mapCreated(controller) {
    _controller = controller;
    _controller.setMapStyle(_mapStyle);
  }

  void reservarAtencion() {
    reservarBooking();
  }

  void reservarBooking() {
    String reservaValida = valReservarBooking(
      hasFechaHora,
      isDateOk,
      conDelivery,
      isDeliveryOk,
      isDayOk,
      isHourOk,
    );

    switch (reservaValida) {
      case "error1":
        mostrarSnackbar(
          'Debe ingresar fecha y hora de la reserva',
          colorRed,
        );
        break;
      case "error2":
        mostrarSnackbar(
          'La hora debe ser mayor',
          colorRed,
        );
        break;
      case "error3":
        mostrarSnackbar(
          'Debe ingresar la dirección para el servicio de movilidad',
          colorRed,
        );
        break;
      case "error4":
        mostrarSnackbar(
          'La veterinaria no atiende el día seleccionado',
          colorRed,
        );
        break;
      case "error5":
        mostrarSnackbar(
          'La veterinaria no atiende en este horario, seleccione entre este rango de horas $takeHora',
          colorRed,
        );
        break;
      case "ok":
        ejecutaReserva();
        break;
    }
  }

  Future<void> ejecutaReserva() async {
    actBtn.value = false;
    BookingSetModel booking = BookingSetModel();
    booking.bookingAt = fechaTimeAt;
    booking.establishmentId = vet.id;
    booking.petId = mascotaId;
    List reservaType = [];

    listaServicio.forEach((element) {
      reservaType.add(element.id);
    });

    booking.observation = observacion;
    if (hasDelivery == true && deliveryId != "1") {
      deliveryTipo = deliveryArray[int.parse(deliveryId) - 1];
    }

    bool resp = await bookingService.setBooking(
      booking,
      reservaType,
      deliveryTipo,
      prefUser.myAddress,
    );

    if (resp) {
      homeC.getSummary();
      PetService().getPet(mascotaId).then(
            (value) => Get.offAll(
              ThxPage(
                value.picture,
                thxReserva[Random().nextInt(thxReserva.length)],
              ),
            ),
          );
    } else {
      actBtn.value = true;
    }
  }
}
