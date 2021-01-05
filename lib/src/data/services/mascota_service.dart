import 'dart:io';

import 'package:proypet/src/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src/data/providers/mascota_provider.dart';

class MascotaService {
  final MascotaProvider mascotaProvider = MascotaProvider();

  getPets() {
    return mascotaProvider.getPets();
  }

  getPet(String idPet) {
    return mascotaProvider.getPet(idPet);
  }

  getVaccines(String idPet) {
    return mascotaProvider.getVaccines(idPet);
  }

  getNextDate(String idPet) {
    return mascotaProvider.getNextDate(idPet);
  }

  getPetHistory(String idPet) {
    return mascotaProvider.getPetHistory(idPet);
  }

  savePet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.savePet(mascota, imagen);
  }

  editPet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.editPet(mascota, imagen);
  }

  muerePet(String idMascota) {
    return mascotaProvider.muerePet(idMascota);
  }

  revivePet(String idMascota) {
    return mascotaProvider.revivePet(idMascota);
  }

  deletePet(String idPet) {
    return mascotaProvider.deletePet(idPet);
  }
}
