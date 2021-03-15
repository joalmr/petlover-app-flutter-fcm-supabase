import 'package:get/get.dart';
import 'package:proypet/source/mascota/service/pet_vaccines_service.dart';

import 'detalle_mascota_controller.dart';

class HistoriaVacunasController extends GetxController {
  final vacunas = PetVaccinesService();

  final petC = Get.find<MascotaDetalleController>();

  RxBool cargando = true.obs;
  RxList<dynamic> listavacunas = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getVacunas();
  }

  getVacunas() => _getVacunas();

  _getVacunas() async {
    listavacunas.clear();
    var dato = await vacunas.getVaccines(petC.mascotaId);
    listavacunas.addAll(dato);
    cargando.value = false;
  }
}
