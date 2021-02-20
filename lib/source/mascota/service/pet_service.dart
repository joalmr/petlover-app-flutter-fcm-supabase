import 'package:proypet/source/mascota/provider/pet_provider.dart';

class PetService {
  final petProvider = PetProvider();

  getPets() {
    return petProvider.getPets();
  }

  getPet(String idPet) {
    return petProvider.getPet(idPet);
  }

  deletePet(String idPet) {
    return petProvider.deletePet(idPet);
  }
}
