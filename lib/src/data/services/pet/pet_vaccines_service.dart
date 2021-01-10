import 'package:proypet/src/data/providers/pet/pet_vaccines_provider.dart';

class PetVaccinesService {
  final petVaccinesProvider = PetVaccinesProvider();
  getVaccines(String idPet) {
    return petVaccinesProvider.getVaccines(idPet);
  }
}
