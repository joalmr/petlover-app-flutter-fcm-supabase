import 'package:get/get.dart';
import 'package:proypet/src/data/services/mascota_service.dart';

import 'detalle_mascota_controller.dart';

class HistoriaVacunasController extends GetxController {
  final mascota = MascotaService();

  final petC = Get.find<MascotaDetalleController>();

  RxBool cargando = true.obs;
  RxList<dynamic> listavacunas = List<dynamic>().obs;

  @override
  void onInit() {
    super.onInit();
    getVacunas();
  }

  getVacunas() => _getVacunas();

  _getVacunas() async {
    listavacunas.clear();
    var dato = await mascota.getVaccines(petC.mascotaId);
    listavacunas.addAll(dato);
    cargando.value = false;
  }
}
