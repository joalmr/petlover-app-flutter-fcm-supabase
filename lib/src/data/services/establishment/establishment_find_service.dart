import 'package:proypet/src/data/providers/establishment/establishment_find_provider.dart';

class EstablishmentFindService {
  final establishmentFindProvider = EstablishmentFindProvider();

  findVets(String vetName) {
    return establishmentFindProvider.findVets(vetName);
  }
}
