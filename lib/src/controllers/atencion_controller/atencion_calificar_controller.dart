import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';
import 'package:proypet/src/data/services/atencion_servicio.dart';

import 'atencion_controller.dart';

class CalificaAtencionController extends GetxController {
  final atencionService = AtencionService();
  final inputComentController = new TextEditingController();

  dynamic argumentos;
  String petImage;
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
    petImage = argumentos['pet_picture'];
    mensaje = argumentos['message'];
    idAtencion = argumentos['id'];

    inputComentController.text = 'Pésimo servicio';
  }

  puntuacion(double rating) {
    myrating = rating;
    switch (rating.toInt()) {
      case 0:
        inputComentController.text = 'Pésimo servicio';
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
    atencion.id = idAtencion;
    atencion.stars = myrating.toInt();
    atencion.comment = inputComentController.text;
    bool resp = await atencionService.calificar(atencion);

    calificado.value = resp;

    if (resp) {
      final atencionC = AtencionController();
      atencionC.getAtenciones();
    }
  }
}
