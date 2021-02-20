import 'package:proypet/source/mascota/provider/pet_vaccines_provider.dart';

class PetVaccinesService {
  final petVaccinesProvider = PetVaccinesProvider();
  getVaccines(String idPet) {
    return petVaccinesProvider.getVaccines(idPet);
  }
}
