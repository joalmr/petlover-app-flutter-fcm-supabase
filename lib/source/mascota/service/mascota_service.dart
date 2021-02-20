import 'dart:io';

import 'package:proypet/source/mascota/model/pet_model.dart';
import 'package:proypet/source/mascota/provider/mascota_provider.dart';

class MascotaService {
  final MascotaProvider mascotaProvider = MascotaProvider();

  savePet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.savePet(mascota, imagen);
  }

  editPet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.editPet(mascota, imagen);
  }
}
