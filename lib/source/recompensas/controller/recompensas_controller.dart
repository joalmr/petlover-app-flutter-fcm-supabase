import 'package:get/get.dart';
import 'package:proypet/source/recompensas/model/bonificacion_model.dart';
import 'package:proypet/source/recompensas/model/bonificacion_top_model.dart';
import 'package:proypet/source/recompensas/service/bonification_service.dart';

class RecompensasController extends GetxController {
  final bonificacionService = BonificacionService();

  BonificacionModel bonificacion;
  RxList<BonificacionTop> top = List<BonificacionTop>().obs;

  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getRecompensa();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getRecompensa();
    return null;
  }

  void getRecompensa() {
    _recompensa();
    _top();
  }

  Future<void> _recompensa() async {
    bonificacion = await bonificacionService.getBonificacion();
    loading.value = false;
  }

  Future<void> _top() async {
    top.clear();
    top.addAll(await bonificacionService.getTop());
  }
}
