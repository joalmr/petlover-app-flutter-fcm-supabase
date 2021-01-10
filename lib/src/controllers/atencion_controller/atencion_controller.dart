import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/providers/attention/model/atencion_model.dart';
import 'package:proypet/src/data/services/attention/attention_service.dart';

class AtencionController extends GetxController {
  final atencionService = AttentionService();
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
