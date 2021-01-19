import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/src/data/providers/establishment/model/establecimiento_short_model.dart';
import 'package:proypet/src/data/services/establishment/establishment_find_service.dart';
import 'package:proypet/src/data/services/establishment/establishment_service.dart';

class BuscarVetController extends GetxController {
  final establecimientoService = EstablishmentService();
  final establishmentFindService = EstablishmentFindService();

  RxList<EstablishmentModelList> veterinarias =
      List<EstablishmentModelList>().obs;
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
    }
  }

  _findVet(vetName) async {
    List<EstablishmentModelList> resp =
        await establishmentFindService.findVets(vetName);
    veterinarias.clear();
    veterinarias.addAll(resp);
    carga.value = false;
  }
}
