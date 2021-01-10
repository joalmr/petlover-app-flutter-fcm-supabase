import 'package:proypet/src/data/providers/attention/model/atencion_model.dart';
import 'package:proypet/src/data/providers/attention/attention_provider.dart';

class AttentionService {
  final atencionProvider = AttentionProvider();

  getAtenciones() {
    return atencionProvider.getAtenciones();
  }

  calificar(AtencionModel atencion) {
    return atencionProvider.calificar(atencion);
  }
}
