import 'package:get/get.dart';
import 'package:proypet/src/models/bonificacion/bonificacion_model.dart';
import 'package:proypet/src2/data/services/bonificacion_servicio.dart';

class RecompensasController extends GetxController {
  final bonificacionService = BonificacionService();

  BonificacionModel bonificacion;

  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getRecompensa();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    // loading.value = true;
    await Future.delayed(Duration(milliseconds: 2));
    getRecompensa();
    return null;
  }

  void getRecompensa() {
    _recompensa();
  }

  Future<void> _recompensa() async {
    bonificacion = await bonificacionService.getBonificacion();
    loading.value = false;
  }
}
