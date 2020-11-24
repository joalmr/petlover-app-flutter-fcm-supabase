import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';

class BuscarVetController extends GetxController {
  final establecimientoService = EstablecimientoService();

  RxList<EstablecimientoModel> veterinarias = List<EstablecimientoModel>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  findVet(vetName) => _findVet(vetName);

  _findVet(vetName) async {
    var resp = await establecimientoService.findVets(vetName);
    veterinarias.clear();
    veterinarias.addAll(resp);
  }
}
