import 'package:proypet/source/veterinarias/provider/establishment_coments_provider.dart';
import 'package:proypet/source/veterinarias/model/comentarios_model.dart';

class EstablishmentComentService {
  final establishmentComentProvider = EstablishmentComentProvider();

  Future<List<Comentarios>> getTenComents(String idVet) {
    return establishmentComentProvider.getTenComents(idVet);
  }

  Future<List<Comentarios>> getComents(String idVet) {
    return establishmentComentProvider.getComents(idVet);
  }
}
