import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/veterinarias/data/model/establecimiento_short_model.dart';
import 'package:proypet/source/veterinarias/data/service/establishment_find_service.dart';
import 'package:proypet/source/veterinarias/data/service/establishment_service.dart';
import 'filtra_vets_controller.dart';

class BuscarVetController extends GetxController {
  final establecimientoService = EstablishmentService();
  final establishmentFindService = EstablishmentFindService();

  RxList<EstablishmentModelList> veterinarias = <EstablishmentModelList>[].obs;
  RxBool carga = false.obs;

  RxBool hasPosition = false.obs;

  @override
  void onInit() {
    super.onInit();
    veterinarias.clear();
    hasPosition.value = prefUser.hasPosition();
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
