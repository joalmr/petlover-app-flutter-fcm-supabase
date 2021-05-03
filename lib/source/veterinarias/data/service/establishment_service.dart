import 'package:proypet/source/veterinarias/data/provider/establishment_provider.dart';

class EstablishmentService {
  final establecimientoProvider = EstablishmentProvider();

  getVets(dynamic filtros) {
    return establecimientoProvider.getVets(filtros);
  }

  getVet(String idVet) {
    return establecimientoProvider.getVet(idVet);
  }
}
