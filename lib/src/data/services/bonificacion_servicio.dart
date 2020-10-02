import 'package:proypet/src/data/models/model/bonificacion/bonificacion_top_model.dart';
import 'package:proypet/src/data/providers/bonificacion_provider.dart';

class BonificacionService {
  final BonificacionProvider bonificacionProvider = BonificacionProvider();

  getBonificacion() {
    return bonificacionProvider.getBonificacion();
  }

  Future<List<BonificacionTop>> getTop() {
    return bonificacionProvider.getTop();
  }
}
