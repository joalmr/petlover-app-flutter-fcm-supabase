import 'package:proypet/source/mascota/provider/pet_next_date_provider.dart';

class PetNextDateService {
  final petNextDateProvider = PetNextDateProvider();

  getNextDate(String idPet) {
    return petNextDateProvider.getNextDate(idPet);
  }
}
