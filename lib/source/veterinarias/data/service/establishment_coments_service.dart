import 'package:proypet/source/veterinarias/data/model/comentarios_model.dart';
import 'package:proypet/source/veterinarias/data/provider/establishment_coments_provider.dart';

class EstablishmentComentService {
  final establishmentComentProvider = EstablishmentComentProvider();

  Future<List<Comentarios>> getTenComents(String idVet) {
    return establishmentComentProvider.getTenComents(idVet);
  }

  Future<List<Comentarios>> getComents(String idVet) {
    return establishmentComentProvider.getComents(idVet);
  }
}
