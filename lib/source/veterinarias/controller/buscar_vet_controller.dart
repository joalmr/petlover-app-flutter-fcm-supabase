import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/model/establecimiento_short_model.dart';
import 'package:proypet/source/veterinarias/service/establishment_find_service.dart';
import 'package:proypet/source/veterinarias/service/establishment_service.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

import 'filtra_vets_controller.dart';

class BuscarVetController extends GetxController {
  final establecimientoService = EstablishmentService();
  final establishmentFindService = EstablishmentFindService();

  RxList<EstablishmentModelList> veterinarias =
      List<EstablishmentModelList>().obs;
  RxBool carga = false.obs;

  final _prefs = new PreferenciasUsuario();
  RxBool hasPosition = false.obs;
  // RxString _findText = "".obs;
  // set findText(String value) => _findText.value = value;
  // String get findText => _findText.value;

  @override
  void onInit() {
    super.onInit();
    veterinarias.clear();
    hasPosition.value = _prefs.hasPosition();
  }

  findVet(vetName) {
    veterinarias.clear();
    if (vetName.length > 2) {
      carga.value = true;
      Timer(Duration(milliseconds: 1000), () => _findVet(vetName));
    }
  }

  _findVet(vetName) async {
    List<EstablishmentModelList> resp =
        await establishmentFindService.findVets(vetName);
    veterinarias.clear();
    veterinarias.addAll(resp);
    carga.value = false;
  }

  filtra() {
    final f = Get.find<FiltraVetsController>();
    f.filtrar();
  }
}
