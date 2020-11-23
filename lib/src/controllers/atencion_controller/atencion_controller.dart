import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';
import 'package:proypet/src/data/services/atencion_servicio.dart';

class AtencionController extends GetxController {
  final atencionService = AtencionService();
  final inputComentController = new TextEditingController();

  RxBool loading = true.obs;

  RxList<AtencionModel> atenciones = List<AtencionModel>().obs;

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
    getAtenciones();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getAtenciones();
    return null;
  }

  getAtenciones() => _getAtenciones();

  _getAtenciones() async {
    var resp = await atencionService.getAtenciones();
    atenciones.clear();
    atenciones.addAll(resp);
    loading.value = false;
  }

  votar(AtencionModel atencion) {
    dynamic argumentos = {
      'pet_picture': '${atencion.establishmentLogo}',
      'message':
          'Califica la atención recibida por ${atencion.establishmentName}',
      'id': '${atencion.id}',
    };

    petImage = argumentos['pet_picture'];
    mensaje = argumentos['message'];
    idAtencion = argumentos['id'];

    inputComentController.text = 'Pésimo servicio';
    calificado.value = false;
    Get.toNamed('calificaatencion');
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
      getAtenciones();
    }
  }
}
