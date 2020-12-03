import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

class BuscarVetController extends GetxController {
  final establecimientoService = EstablecimientoService();

  RxList<EstablecimientoModel> veterinarias = List<EstablecimientoModel>().obs;
  RxBool carga = false.obs;
  @override
  void onInit() {
    super.onInit();
    veterinarias.clear();
  }

  findVet(vetName) {
    if (vetName.length > 2) {
      carga.value = true;
      Timer(Duration(milliseconds: 500), () => _findVet(vetName));
    } else {
      veterinarias.clear();
    }
  }

  _findVet(vetName) async {
    var resp = await establecimientoService.findVets(vetName);
    veterinarias.clear();
    veterinarias.addAll(resp);
    carga.value = false;
  }
}
