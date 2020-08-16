import 'package:proypet/src2/data/providers/bonificacion_provider.dart';

class BonificacionService {
  final BonificacionProvider bonificacionProvider = BonificacionProvider();

  getBonificacion() {
    return bonificacionProvider.getBonificacion();
  }
}
