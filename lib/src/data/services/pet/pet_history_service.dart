import 'package:proypet/src/data/providers/pet/pet_history_provider.dart';

class PetHistoryService {
  final PetHistoryProvider petHistoryProvider = PetHistoryProvider();

  getPetHistory(String idPet) {
    return petHistoryProvider.getPetHistory(idPet);
  }

  getPetHistoryDate(String idPet, String year, String month) {
    return petHistoryProvider.getPetHistoryDate(idPet, year, month);
  }
}
