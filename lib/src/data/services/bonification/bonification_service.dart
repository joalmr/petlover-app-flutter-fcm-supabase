import 'package:proypet/src/data/providers/bonification/model/bonificacion_top_model.dart';
import 'package:proypet/src/data/providers/bonification/bonification_provider.dart';

class BonificacionService {
  final bonificacionProvider = BonificationProvider();

  getBonificacion() {
    return bonificacionProvider.getBonificacion();
  }

  Future<List<BonificacionTop>> getTop() {
    return bonificacionProvider.getTop();
  }
}
