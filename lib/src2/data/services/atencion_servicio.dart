import 'package:proypet/src/models/antecion/atencion_model.dart';
import 'package:proypet/src2/data/providers/atencion_provider.dart';

class AtencionService {
  final AtencionProvider atencionProvider = AtencionProvider();

  getAtenciones() {
    return atencionProvider.getAtenciones();
  }

  calificar(AtencionModel atencion) {
    return atencionProvider.calificar(atencion);
  }
}
