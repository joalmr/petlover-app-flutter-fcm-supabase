import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/booking/model/booking_model.dart';
import 'package:proypet/source/booking/service/booking_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_controller.dart';

class DetalleRservadoController extends GetxController {
  final bookingService = BookingService();
  final homeController = Get.find<HomeController>();

  BookingModel argumentos;

  @override
  void onInit() {
    super.onInit();
    argumentos = Get.arguments;
  }

  void llamar() => _launchPhone(argumentos.establishmentPhone);
  _launchPhone(String phone) async {
    var url = 'tel:$phone';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'No se pudo llamar $url';
  }

  alertaEliminar() => _alertaEliminar(argumentos.bookingId);
  _alertaEliminar(id) {
    return Get.dialog(FadeIn(
      child: AlertDialog(
        title: Text('Eliminar'),
        content: Text('Seguro que desea eliminar esta reserva?'),
        actions: <Widget>[
          btnAltern(
            text: 'Cancelar',
            onPressed: () => Get.back(),
            color: Get.textTheme.subtitle2.color,
          ),
          btnAltern(
            text: 'Sí, eliminar',
            onPressed: () => eliminaAtencion(id),
            color: colorRed,
          ),
        ],
      ),
    ));
  }

  void eliminaAtencion(id) => _eliminaAtencion(id);
  Future<void> _eliminaAtencion(id) async {
    var resp = await bookingService.deleteBooking(id);
    if (resp) {
      homeController.getSummary();
      await Get.offAllNamed('nav/inicio');
    } else {
      mostrarSnackbar("No se eliminó la atención", colorRed);
    }
  }
}
