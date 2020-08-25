import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/comentarios_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

import 'detalle_vet_controller.dart';

class ComentarioVetController extends GetxController {
  final establecimiento = EstablecimientoService();
  final vetC = Get.find<VetDetalleController>();

  RxBool cargando = true.obs;
  List<Comentarios> comentarios = [];

  @override
  void onInit() {
    super.onInit();
    verComentarios();
  }

  verComentarios() => _verComentarios();

  _verComentarios() async {
    comentarios = await establecimiento.getComents(vetC.vet.id);
    cargando.value = false;
  }
}
