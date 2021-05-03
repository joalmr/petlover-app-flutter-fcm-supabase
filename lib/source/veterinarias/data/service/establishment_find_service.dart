import 'package:proypet/source/veterinarias/data/provider/establishment_find_provider.dart';

class EstablishmentFindService {
  final establishmentFindProvider = EstablishmentFindProvider();

  findVets(String vetName) {
    return establishmentFindProvider.findVets(vetName);
  }
}
