import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/promocion_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

import 'detalle_vet_controller.dart';

class PromocionVetController extends GetxController {
  final establecimiento = EstablecimientoService();
  final vetC = Get.find<VetDetalleController>();

  RxBool cargando = true.obs;
  RxList<PromocionModel> promociones = List<PromocionModel>().obs;

  @override
  void onInit() {
    super.onInit();

    verPromociones();
  }

  verPromociones() => _verPromociones();

  _verPromociones() async {
    promociones.clear();
    var dato = await establecimiento.getOffers(vetC.vet.id);
    promociones.addAll(dato);
    cargando.value = false;
  }
}
