import 'package:proypet/source/recompensas/model/bonificacion_top_model.dart';
import 'package:proypet/source/recompensas/provider/bonification_provider.dart';

class BonificacionService {
  final bonificacionProvider = BonificationProvider();

  getBonificacion() {
    return bonificacionProvider.getBonificacion();
  }

  Future<List<BonificacionTop>> getTop() {
    return bonificacionProvider.getTop();
  }
}
