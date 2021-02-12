import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/maps/address.dart';
import 'package:proypet/src/data/models/booking/booking_set_model.dart';
import 'package:proypet/src/data/models/establishment/establecimiento_model.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/snackbar.dart';
import 'package:proypet/src/app/components/thx_page.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/pet/pet_model.dart';
import 'package:proypet/src/data/services/booking/booking_service.dart';
import 'package:proypet/src/data/services/pet/pet_service.dart';
import 'package:proypet/src/utils/add_msg.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:time_parser/time_parser.dart';
import '../../app/views/pages/_nav_view/veterinarias/reserva/components/lista_servicios.dart';
import 'data/horario.dart';
import 'detalle_vet_controller.dart';

class ReservaVetController extends GetxController {
  final homeC = Get.find<HomeController>();
  final vetdC = Get.find<VetDetalleController>();
  final bookingService = BookingService();

  final _prefs = new PreferenciasUsuario();

  EstablecimientoModel vet;
  List<MascotaModel2> misMascotas;

  ServicioReserva ex3;
  List<ServicioReserva> listaServicio = [];
  List<String> listaReservaId = []; //llenarlo antes de enviar

  bool hasDelivery;

  RxString _deliveryId = '1'.obs;
  RxString _mascotaId = ''.obs;

  RxList<ServicioReserva> servicioReservaLista = List<ServicioReserva>().obs;
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
  RxList<Marker> marcador = List<Marker>().obs;

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
    pickedTime = TimeOfDay.now(); //TODO

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
    hora = pickedTime.format(Get.context);
    bool lengthHora = hora.split(":")[0].length == 1;
    if (lengthHora) hora = "0$hora";
    inputHoraController.text = hora;
    fecha = format.format(DateTime.now());
  }

  direccionInicial() {
    if (_prefs.hasMyAddressLatLng()) {
      lat = double.parse(_prefs.myAddressLatLng.split(',')[0]);
      lng = double.parse(_prefs.myAddressLatLng.split(',')[1]);
      zoomIn = 16.0;

      if (_prefs.hasMyAddress()) {
        inputDireccionController.text = _prefs.myAddress;
      }

      marcador.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(lat, lng),
          draggable: true,
          onDragEnd: ((value) {
            lat = value.latitude;
            lng = value.longitude;
            _prefs.myAddressLatLng = "$lat,$lng";
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

  bool get hasFechaHora => fecha.trim().isEmpty || hora.trim().isEmpty;

  DateTime get fechaTime => DateTime.parse(fecha + " " + hora);

  String get fechaTimeAt => DateFormat('yyyy-MM-dd kk:mm:ss').format(fechaTime);

  bool get isDateOk {
    bool respuesta = true;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    if (formattedDate == fechaTimeAt.split(' ')[0] &&
        fechaTime.hour < (now.hour - 1)) {
      respuesta = false;
    }
    return respuesta;
  }

  bool get conDelivery => hasDelivery && deliveryId != '1';

  bool get isDeliveryOk =>
      hasDelivery &&
      deliveryId != '1' &&
      inputDireccionController.text.trim() != '';

  bool get isDayOk {
    int day = fechaTime.weekday;
    var horario = vet.schedule;
    var takeHora = horario[textHorario[day]];

    if (takeHora['attention'] == 'on')
      return true;
    else
      return false;
  }

  bool get isHourOk {
    int day = fechaTime.weekday;
    var horario = vet.schedule;
    var takeHora = horario[textHorario[day]];

    var time0 = TimeParser.parse(hora);
    var time1 = TimeParser.parse(takeHora['time_start']);
    var time2 = TimeParser.parse(takeHora['time_end']);

    var hora0 = time0.hours * 60 + time0.minutes;
    var horaInicio = time1.hours * 60 + time1.minutes;
    var horaFin = time2.hours * 60 + time2.minutes;

    if (takeHora['attention'] == 'on') {
      if (horaInicio <= hora0 && hora0 < horaFin)
        return true;
      else
        return false;
    } else
      return false;
  }

  String get takeHora {
    int day = fechaTime.weekday;
    var horario = vet.schedule;
    var takeHora = horario[textHorario[day]];
    var time1 = TimeParser.parse(takeHora['time_start']);
    var time2 = TimeParser.parse(takeHora['time_end']);

    return '$time1 - $time2';
  }

  gpsDireccion(Prediction2 data) {
    _searchandNavigate(data);
  }

  _searchandNavigate(Prediction2 dato) async {
    if (inputDireccionController.text.trim() != "") {
      marcador.clear();
      final places = new GoogleMapsPlaces(apiKey: keyMap);
      final mapdata = await places.getDetailsByPlaceId(dato.placeId);

      inputDireccionController.text = dato.name;

      Location latlng = mapdata.result.geometry.location;
      lat = latlng.lat;
      lng = latlng.lng;

      _prefs.myAddressLatLng = "$lat,$lng";
      _prefs.myAddress = dato.name;

      marcador.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(lat, lng),
          draggable: true,
          onDragEnd: ((value) {
            lat = value.latitude;
            lng = value.longitude;
            _prefs.myAddressLatLng = "$lat,$lng";
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
    if (hasFechaHora) {
      mostrarSnackbar('Debe ingresar fecha y hora de la reserva', colorRed);
    } else {
      if (!isDateOk) {
        mostrarSnackbar('La hora debe ser mayor', colorRed);
      } else {
        if (conDelivery) {
          if (isDeliveryOk) {
            if (isDayOk) {
              if (isHourOk) {
                ejecutaReserva();
              } else {
                mostrarSnackbar(
                    'La veterinaria no atiende en este horario, seleccione entre este rango de horas $takeHora',
                    colorRed);
              }
            } else {
              mostrarSnackbar(
                  'La veterinaria no atiende el día seleccionado', colorRed);
            }
          } else {
            mostrarSnackbar(
                'Debe ingresar la dirección para el servicio de movilidad',
                colorRed);
          }
        } else {
          if (isDayOk) {
            if (isHourOk) {
              ejecutaReserva();
            } else {
              mostrarSnackbar(
                  'La veterinaria no atiende en este horario, seleccione entre este rango de horas $takeHora',
                  colorRed);
            }
          } else {
            mostrarSnackbar(
                'La veterinaria no atiende el día seleccionado', colorRed);
          }
        }
      }
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
      _prefs.myAddress,
    );

    if (resp) {
      homeC.getSummary();
      PetService().getPet(mascotaId).then(
            (value) => Get.to(
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
