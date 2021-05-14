import 'dart:async';
import 'package:get/get.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/mascota/service/pet_dead_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';

import 'detalle_mascota_controller.dart';

class MascotaDrawerController extends GetxController {
  final petC = Get.find<MascotaDetalleController>();
  final homeC = Get.find<HomeController>();
  final petService = PetService();
  final petDeadService = PetDeadService();

  @override
  void onInit() {
    super.onInit();
  }

  void falleceMascota(bool fallecido) {
    if (fallecido)
      _falleceMascota(petC.pet.id);
    else
      _reviveMascota(petC.pet.id);
  }

  Future<void> _falleceMascota(String mascota) async {
    bool resp = await petDeadService.muerePet(mascota);
    if (resp) {
      homeC.getSummary();
      mostrarSnackbar("${petC.pet.name} ha fallecido 😔", colorMain);
      Timer(Duration(milliseconds: 1500), () => Get.offAllNamed('/'));
    } else
      Get.back();
  }

  Future<void> _reviveMascota(String mascota) async {
    bool resp = await petDeadService.revivePet(mascota);
    if (resp) {
      homeC.getSummary();
      mostrarSnackbar("${petC.pet.name} está bien 😅", colorMain);
      Timer(Duration(milliseconds: 1500), () => Get.offAllNamed('/'));
    } else
      Get.back();
  }

  void eliminaMascota() {
    _eliminaMascota();
  }

  Future<void> _eliminaMascota() async {
    bool resp = await petService.deletePet(petC.pet.id);
    if (resp) {
      homeC.getSummary();
      Get.offAllNamed('nav/inicio');
    } else
      Get.back();
  }
}
