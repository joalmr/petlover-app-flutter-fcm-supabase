import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/data/models/model/booking/booking_home.dart';
import 'package:proypet/src/data/services/booking_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_controller.dart';

class DetalleRservadoController extends GetxController {
  final bookingService = BookingService();
  final homeController = Get.find<HomeController>();

  BookingHome argumentos;

  @override
  void onInit() {
    super.onInit();
    argumentos = Get.arguments;
  }

  bool get vencido {
    DateTime now = DateTime.now();
    var fechaAt = argumentos.date.split('-');
    bool vencido = false;
    if (int.parse(fechaAt[0]) < now.day &&
        int.parse(fechaAt[1]) == now.month &&
        int.parse(fechaAt[2]) == now.year) {
      vencido = true;
    }
    return vencido;
  }

  void llamar() {
    print(argumentos.establishmentPhone);
    _launchPhone(argumentos.establishmentPhone);
  }

  _launchPhone(String phone) async {
    var url = 'tel:$phone';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'No se pudo llamar $url';
  }

  void abreMaps() {
    _abreMaps();
  }

  _abreMaps() async {
    final title = argumentos.establishmentName;
    final description = argumentos.address;
    final coords =
        Coords(argumentos.establishmentLat, argumentos.establishmentLng);
    final availableMaps = await MapLauncher.installedMaps;

    Get.bottomSheet(SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Get.theme.backgroundColor,
          child: Wrap(
            children: <Widget>[
              for (var map in availableMaps)
                ListTile(
                  onTap: () => map.showMarker(
                    coords: coords,
                    title: title,
                    description: description,
                  ),
                  title: Text(map.mapName),
                  leading: Image(image: map.icon, height: 30.0, width: 30.0),
                ),
            ],
          ),
        ),
      ),
    ));
  }

  alertaEliminar() {
    _alertaEliminar(argumentos.id);
  }

  _alertaEliminar(id) {
    return Get.dialog(FadeIn(
      child: AlertDialog(
        title: Text('Eliminar'),
        content: Text('Seguro que desea eliminar esta reserva?'),
        actions: <Widget>[
          buttonModal(
              'Cancelar', () => Get.back(), Get.textTheme.subtitle2.color),
          buttonModal('Sí, eliminar', () => eliminaAtencion(id), colorRed),
        ],
      ),
    ));
  }

  void eliminaAtencion(id) {
    _eliminaAtencion(id);
  }

  Future<void> _eliminaAtencion(id) async {
    var resp = await bookingService.deleteBooking(id);
    if (resp) {
      homeController.getSummary();
      await Get.offAllNamed('navInicio');
    } else {
      mostrarSnackbar("No se eliminó la atención", colorRed);
    }
  }
}
