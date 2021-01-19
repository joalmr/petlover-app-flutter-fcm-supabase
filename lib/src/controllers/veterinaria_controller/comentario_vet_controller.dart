import 'package:get/get.dart';
import 'package:proypet/src/data/providers/establishment/model/comentarios_model.dart';
import 'package:proypet/src/data/services/establishment/establishment_coments_service.dart';
import 'package:proypet/src/data/services/establishment/establishment_service.dart';

import 'detalle_vet_controller.dart';

class ComentarioVetController extends GetxController {
  final establecimiento = EstablishmentService();
  final establishmentComentService = EstablishmentComentService();

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
    var dato = await establishmentComentService.getTenComents(vetC.vet.id);
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
    var dato = await establishmentComentService.getComents(vetC.vet.id);
    allComments.addAll(dato);
    cargando.value = false;
  }
}
