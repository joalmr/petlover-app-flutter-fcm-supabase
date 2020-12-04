import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_short_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import '../_global_controller.dart';
import 'filtra_vets_controller.dart';

class VeterinariasController extends GetxController {
  final vetService = EstablecimientoService();
  RxList<EstablecimientoShortModel> vetLocales =
      List<EstablecimientoShortModel>().obs;
  RxList<EstablecimientoShortModel> temp =
      List<EstablecimientoShortModel>().obs;

  List<int> listaFiltros = [];
  RxInt respVets = 0.obs;
  RxBool loading = true.obs;

  final global = Get.find<GlobalController>();

  final _prefs = new PreferenciasUsuario();

  @override
  void onInit() {
    super.onInit();
    if (_prefs.hasToken()) {
      getVets();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getVets();
    return null;
  }

  getVets() => _getVets();

  Future<void> _getVets() async {
    loading.value = true;
    var resp = await vetService.getVets(listaFiltros);
    respVets.value = resp['code']; // == 200
    vetLocales.clear();
    vetLocales.addAll(resp['establecimientos']);
    temp.clear();
    temp.addAll(resp['establecimientos']);
    loading.value = false;
  }

  bool ordena = false;
  orderVets() {
    ordena = !ordena;
    if (ordena) {
      vetLocales.sort();
    } else {
      vetLocales.clear();
      vetLocales.addAll(temp);
    }
  }

  bool get gps => respVets.value == 200;

  filtra() {
    final f = Get.find<FiltraVetsController>();
    f.filtrar();
  }
}
