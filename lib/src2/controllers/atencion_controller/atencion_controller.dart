import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/antecion/atencion_model.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/data/services/atencion_servicio.dart';

class AtencionController extends GetxController {
  final atencionService = AtencionService();
  final inputComentController = new TextEditingController();

  RxDouble _myrating = 0.0.obs;

  RxBool loading = true.obs;

  set myrating(double value) => _myrating.value = value;
  double get myrating => _myrating.value;

  List<AtencionModel> atenciones;

  @override
  void onInit() {
    super.onInit();
    getAtenciones();
  }

  getAtenciones() => _getAtenciones();

  _getAtenciones() async {
    atenciones = await atencionService.getAtenciones();
    loading.value = false;
  }

  onRate(AtencionModel atencion) => _onRate(atencion);

  _onRate(AtencionModel atencion) async {
    atencion.stars = myrating.toInt();
    atencion.comment = inputComentController.text;
    bool resp = await atencionService.calificar(atencion);

    if (resp) {
      Get.dialog(
        FadeIn(
          child: AlertDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            content: Container(
              height: 100.0,
              child: Center(
                child: Text(
                  'Se calificó la atención.',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          ),
        ),
      );
      getAtenciones();
      Timer(Duration(milliseconds: 2000), () => Get.until((route) => route.isFirst));
    } else
      mostrarSnackbar('No se calificó la atención.', colorRed);
  }
}
