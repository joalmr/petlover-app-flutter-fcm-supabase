import 'package:proypet/src/data/models/model/establecimiento/comentarios_model.dart';
import 'package:proypet/src/data/models/model/establecimiento/promocion_model.dart';
import 'package:proypet/src/data/providers/establecimiento_provider.dart';

class EstablecimientoService {
  final EstablecimientoProvider establecimientoProvider =
      EstablecimientoProvider();

  findVets(String vetName) {
    return establecimientoProvider.findVets(vetName);
  }

  getVets(dynamic filtros) {
    return establecimientoProvider.getVets(filtros);
  }

  getVet(String idVet) {
    return establecimientoProvider.getVet(idVet);
  }

  Future<List<Comentarios>> getTenComents(String idVet) {
    return establecimientoProvider.getTenComents(idVet);
  }

  Future<List<Comentarios>> getComents(String idVet) {
    return establecimientoProvider.getComents(idVet);
  }

  Future<List<PromocionModel>> getOffers(String idVet) {
    return establecimientoProvider.getOffers(idVet);
  }
}
