import 'package:get/get.dart';
import 'package:proypet/src2/data/models/update/mascota/history_model.dart';
// import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';
// import 'package:proypet/src/models/mascota/pet_model.dart';
import 'package:proypet/src2/data/services/mascota_service.dart';

class MascotaDetalleController extends GetxController {
  String mascotaId;
  final mascotaService = new MascotaService();
  RxBool loading = true.obs;

  MascotaModel2 pet;
  RxList<HistoriaModel2> history = List<HistoriaModel2>().obs;

  @override
  void onInit() {
    super.onInit();
    mascotaId = Get.arguments;
    verMiMascota();
  }

  void verMiMascota() {
    _verMiMascota();
  }

  Future<void> _verMiMascota() async {
    pet = await mascotaService.getPet(mascotaId);
    await _verMiHistoria(mascotaId);
    loading.value = false;
  }

  void verMiHistoria(id) {
    _verMiHistoria(id);
  }

  Future<void> _verMiHistoria(id) async {
    history.clear();
    history.addAll(await mascotaService.getPetHistory(id));
  }
}
