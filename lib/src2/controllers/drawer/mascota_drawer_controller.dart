import 'package:get/get.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/controllers/mascota_controller/detalle_mascota_controller.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src2/data/services/mascota_service.dart';

class MascotaDrawerController extends GetxController {
  final petC = Get.find<MascotaDetalleController>();
  final homeC = Get.find<HomeController>();
  final mascotaService = MascotaService();

  @override
  void onInit() {
    super.onInit();
    print(petC.pet.name);
  }

  void falleceMascota(bool fallecido) {
    petC.pet.status = 0;
    if (!fallecido) {
      petC.pet.status = 1;
    }

    _falleceMascota(petC.pet);
  }

  Future<void> _falleceMascota(MascotaModel2 mascota) async {
    bool resp = await mascotaService.muerePet(mascota);
    if (resp) {
      petC.verMiMascota();
      Get.back();
    } else
      Get.back();
  }

  void eliminaMascota() {
    _eliminaMascota();
  }

  Future<void> _eliminaMascota() async {
    bool resp = await mascotaService.deletePet(petC.pet.id);
    if (resp) {
      homeC.getSummary();
      Get.offAllNamed('navInicio');
    } else
      Get.back();
  }
}
