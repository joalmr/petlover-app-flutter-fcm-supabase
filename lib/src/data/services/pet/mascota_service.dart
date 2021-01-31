import 'dart:io';

import 'package:proypet/src/data/models/pet/pet_model.dart';
import 'package:proypet/src/data/providers/pet/mascota_provider.dart';

class MascotaService {
  final MascotaProvider mascotaProvider = MascotaProvider();

  savePet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.savePet(mascota, imagen);
  }

  editPet(MascotaModel2 mascota, File imagen) {
    return mascotaProvider.editPet(mascota, imagen);
  }
}
