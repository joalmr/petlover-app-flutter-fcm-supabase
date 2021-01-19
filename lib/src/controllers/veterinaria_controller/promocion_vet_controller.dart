import 'package:get/get.dart';
import 'package:proypet/src/data/providers/establishment/model/promocion_model.dart';
import 'package:proypet/src/data/services/establishment/establishment_offers_service.dart';
import 'package:proypet/src/data/services/establishment/establishment_service.dart';

import 'detalle_vet_controller.dart';

class PromocionVetController extends GetxController {
  final establecimiento = EstablishmentService();
  final establishmentOfferService = EstablishmentOfferService();

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
    var dato = await establishmentOfferService.getOffers(vetC.vet.id);
    promociones.addAll(dato);
    cargando.value = false;
  }
}
