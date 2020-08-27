import 'package:get/get.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';
import 'package:proypet/src/data/services/mascota_service.dart';

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
    if (fallecido)
      _falleceMascota(petC.pet.id);
    else
      _reviveMascota(petC.pet.id);
  }

  Future<void> _falleceMascota(String mascota) async {
    bool resp = await mascotaService.muerePet(mascota);
    if (resp) {
      petC.verMiMascota();
      Get.back();
    } else
      Get.back();
  }

  Future<void> _reviveMascota(String mascota) async {
    bool resp = await mascotaService.revivePet(mascota);
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
