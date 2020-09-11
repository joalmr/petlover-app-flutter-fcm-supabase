import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';
// import 'package:proypet/src/utils/posicion.dart';

import '../_global_controller.dart';
import 'filtra_vets_controller.dart';

class VeterinariasController extends GetxController {
  final vetService = EstablecimientoService();
  RxList<EstablecimientoModel> vetLocales = List<EstablecimientoModel>().obs;

  List<int> listaFiltros = [];
  RxInt respVets = 0.obs;
  RxBool loading = true.obs;

  final global = Get.find<GlobalController>();

  @override
  void onInit() {
    super.onInit();
    getVets();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //
  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    return null;
  }

  getVets() => _getVets();

  Future<void> _getVets() async {
    loading.value = true;
    var resp = await vetService.getVets(listaFiltros);
    respVets.value = resp['code']; // == 200
    vetLocales.clear();
    vetLocales.addAll(resp['establecimientos']);
    loading.value = false;
  }

  bool get gps => respVets.value == 200;

  filtra() {
    final f = Get.find<FiltraVetsController>();
    f.filtrar();
  }
}
