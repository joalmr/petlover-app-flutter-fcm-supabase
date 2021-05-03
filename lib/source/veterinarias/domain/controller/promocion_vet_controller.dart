import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/data/model/promocion_model.dart';
import 'package:proypet/source/veterinarias/data/service/establishment_offers_service.dart';
import 'package:proypet/source/veterinarias/data/service/establishment_service.dart';
import 'detalle_vet_controller.dart';

class PromocionVetController extends GetxController {
  final establecimiento = EstablishmentService();
  final establishmentOfferService = EstablishmentOfferService();

  final vetC = Get.find<VetDetalleController>();

  RxBool cargando = true.obs;
  RxList<PromocionModel> promociones = <PromocionModel>[].obs;

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
