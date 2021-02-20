import 'package:proypet/source/breeds/provider/raza_provider.dart';

class RazaService {
  final RazaProvider razaProvider = RazaProvider();

  getBreed(String idRaza) {
    return razaProvider.getBreed(idRaza);
  }
}
