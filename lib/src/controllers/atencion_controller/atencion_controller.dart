import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';
import 'package:proypet/src/data/services/atencion_servicio.dart';

class AtencionController extends GetxController {
  final atencionService = AtencionService();
  final inputComentController = new TextEditingController();

  RxBool loading = true.obs;

  RxList<AtencionModel> atenciones = List<AtencionModel>().obs;

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

    Get.toNamed('calificaatencion', arguments: argumentos);
  }
}
