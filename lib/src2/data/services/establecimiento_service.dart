import 'package:proypet/src2/data/providers/establecimiento_provider.dart';

class EstablecimientoService {
  final EstablecimientoProvider establecimientoProvider = EstablecimientoProvider();

  getVets(dynamic filtros) {
    return establecimientoProvider.getVets(filtros);
  }

  getVet(String idVet) {
    return establecimientoProvider.getVet(idVet);
  }

  getComents(String idVet) {
    return establecimientoProvider.getComents(idVet);
  }
}
