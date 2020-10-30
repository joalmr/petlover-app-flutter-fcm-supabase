import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/comentarios_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

import 'detalle_vet_controller.dart';

class ComentarioVetController extends GetxController {
  final establecimiento = EstablecimientoService();
  final vetC = Get.find<VetDetalleController>();

  RxBool cargando = true.obs;
  RxList<Comentarios> comentarios = List<Comentarios>().obs;
  // List<Comentarios> comentarios10 = [];

  @override
  void onInit() {
    super.onInit();

    verComentarios();
  }

  verComentarios() => _verComentarios();

  _verComentarios() async {
    comentarios.clear();
    var dato = await establecimiento.getComents(vetC.vet.id);
    comentarios.addAll(dato);
    cargando.value = false;
  }

  // ver10Comentarios() => _ver10Comentarios();

  // _ver10Comentarios() async {
  //   var dato = await establecimiento.getComents(vetC.vet.id);
  //   comentarios10 = dato.take(10).toList();
  //   cargando.value = false;
  // }
}
