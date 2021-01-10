import 'package:proypet/src/data/providers/establishment/model/comentarios_model.dart';
import 'package:proypet/src/data/providers/establishment/model/promocion_model.dart';
import 'package:proypet/src/data/providers/establishment/establishment_provider.dart';

class EstablishmentService {
  final establecimientoProvider = EstablishmentProvider();

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
