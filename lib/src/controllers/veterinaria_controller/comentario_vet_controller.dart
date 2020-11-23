import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/comentarios_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

import 'detalle_vet_controller.dart';

class ComentarioVetController extends GetxController {
  final establecimiento = EstablecimientoService();
  final vetC = Get.find<VetDetalleController>();

  RxBool cargando = true.obs;
  RxList<Comentarios> comentarios = List<Comentarios>().obs;
  RxList<Comentarios> allComments = List<Comentarios>().obs;

  @override
  void onInit() {
    super.onInit();

    getTenComents();
  }

  getTenComents() => _getTenComents();

  _getTenComents() async {
    comentarios.clear();
    var dato = await establecimiento.getTenComents(vetC.vet.id);
    comentarios.addAll(dato);
    cargando.value = false;
  }

  verComentarios() {
    getAllComents();
    Get.toNamed('vermascomentarios');
  }

  getAllComents() => _getAllComents();

  _getAllComents() async {
    allComments.clear();
    var dato = await establecimiento.getComents(vetC.vet.id);
    allComments.addAll(dato);
    cargando.value = false;
  }
}
