import 'package:proypet/src/data/providers/pet/pet_dead_provider.dart';

class PetDeadService {
  final petDeadProvider = PetDeadProvider();

  muerePet(String idMascota) {
    return petDeadProvider.muerePet(idMascota);
  }

  revivePet(String idMascota) {
    return petDeadProvider.revivePet(idMascota);
  }
}
