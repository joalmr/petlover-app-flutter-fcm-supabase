import 'package:proypet/source/atencion/model/atencion_model.dart';
import 'package:proypet/source/atencion/provider/attention_provider.dart';

class AttentionService {
  final atencionProvider = AttentionProvider();

  getAtenciones() {
    return atencionProvider.getAtenciones();
  }

  calificar(AtencionModel atencion) {
    return atencionProvider.calificar(atencion);
  }
}
