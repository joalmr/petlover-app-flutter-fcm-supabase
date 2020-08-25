import 'package:proypet/src/data/providers/bonificacion_provider.dart';

class BonificacionService {
  final BonificacionProvider bonificacionProvider = BonificacionProvider();

  getBonificacion() {
    return bonificacionProvider.getBonificacion();
  }
}
