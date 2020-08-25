import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';
import 'package:proypet/src/data/providers/atencion_provider.dart';

class AtencionService {
  final AtencionProvider atencionProvider = AtencionProvider();

  getAtenciones() {
    return atencionProvider.getAtenciones();
  }

  calificar(AtencionModel atencion) {
    return atencionProvider.calificar(atencion);
  }
}
