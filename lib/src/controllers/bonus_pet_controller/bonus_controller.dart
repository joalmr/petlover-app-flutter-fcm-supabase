import 'package:get/get.dart';
import 'package:proypet/src/data/models/bonification/bonificacion_model.dart';
import 'package:proypet/src/data/services/bonification/bonification_service.dart';

class BonusController extends GetxController {
  final bonusService = BonificacionService();

  RxList<Bonification> bonificados = List<Bonification>().obs;
  RxBool cargando = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBonus();
  }

  getBonus() => _getBonus();

  _getBonus() async {
    BonificacionModel resp = await bonusService.getBonificacion();
    bonificados.clear();
    bonificados.addAll(resp.bonifications);
    cargando.value = false;
  }
}
