import 'package:proypet/src/data/providers/establishment/establishment_coments_provider.dart';
import 'package:proypet/src/data/models/establishment/comentarios_model.dart';

class EstablishmentComentService {
  final establishmentComentProvider = EstablishmentComentProvider();

  Future<List<Comentarios>> getTenComents(String idVet) {
    return establishmentComentProvider.getTenComents(idVet);
  }

  Future<List<Comentarios>> getComents(String idVet) {
    return establishmentComentProvider.getComents(idVet);
  }
}
