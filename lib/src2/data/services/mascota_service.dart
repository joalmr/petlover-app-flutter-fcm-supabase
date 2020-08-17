import 'dart:io';

import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src2/data/providers/mascota_provider.dart';

class MascotaService {
  final MascotaProvider mascotaProvider = MascotaProvider();

  getPets() {
    return mascotaProvider.getPets();
  }

  getPet(String idPet) {
    return mascotaProvider.getPet(idPet);
  }

  getPetHistory(String idPet) {
    return mascotaProvider.getPetHistory(idPet);
  }

  savePet(MascotaModel mascota, File imagen) {
    return mascotaProvider.savePet(mascota, imagen);
  }

  editPet(MascotaModel mascota, File imagen) {
    return mascotaProvider.editPet(mascota, imagen);
  }

  muerePet(MascotaModel2 mascota) {
    return mascotaProvider.muerePet(mascota);
  }

  deletePet(String idPet) {
    return mascotaProvider.deletePet(idPet);
  }
}
