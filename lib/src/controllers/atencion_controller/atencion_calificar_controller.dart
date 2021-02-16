import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/components/snackbar.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/attention/atencion_model.dart';
import 'package:proypet/src/data/services/attention/attention_service.dart';
import 'atencion_controller.dart';

class CalificaAtencionController extends GetxController {
  final atencionService = AttentionService();
  final inputComentController = new TextEditingController();

  dynamic argumentos;
  String vetLogo;
  String bonificacion;
  String mensaje;
  String idAtencion;

  RxDouble _myrating = 0.0.obs;
  RxBool calificado = false.obs;

  set myrating(double value) => _myrating.value = value;
  double get myrating => _myrating.value;

  @override
  void onInit() {
    super.onInit();
    argumentos = Get.arguments;
    vetLogo = argumentos['establishment_logo'];
    bonificacion = argumentos['attention_bonification'];
    mensaje = argumentos['message'];
    idAtencion = argumentos['attention_id'];

    // inputComentController.text = 'Pésimo servicio';
  }

  puntuacion(double rating) {
    myrating = rating;
    switch (rating.toInt()) {
      case 0:
        inputComentController.text = '';
        break;
      case 1:
        inputComentController.text = 'Mal servicio';
        break;
      case 2:
        inputComentController.text = 'Mm regular';
        break;
      case 3:
        inputComentController.text = 'Estuvo bien';
        break;
      case 4:
        inputComentController.text = 'Me gustó';
        break;
      case 5:
        inputComentController.text = 'Excelente! Recomendado';
        break;
      default:
    }
  }

  onRate() => _onRate();

  _onRate() async {
    AtencionModel atencion = new AtencionModel();
    atencion.attentionId = idAtencion;
    atencion.stars = myrating.toInt();
    atencion.comment = inputComentController.text;

    if (myrating.toInt() == 0) {
      mostrarSnackbar('Seleccione estrellas ⭐️', colorRed);
    } else {
      bool resp = await atencionService.calificar(atencion);

      calificado.value = resp;

      if (resp) {
        final atencionC = AtencionController();
        atencionC.getAtenciones();
      }
    }
  }
}
