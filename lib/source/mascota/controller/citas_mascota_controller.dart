import 'package:get/get.dart';
import 'package:proypet/source/mascota/service/pet_next_date_service.dart';

import 'detalle_mascota_controller.dart';

class CitasController extends GetxController {
  final nextDate = PetNextDateService();
  final petC = Get.find<MascotaDetalleController>();

  RxBool cargando = true.obs;
  RxList<dynamic> listacitas = <dynamic>[].obs;

  var tipoEn = ['consultation', 'deworming', 'grooming', 'vaccination'];
  var tipoEs = ['consulta', 'desparasitación', 'grooming', 'vacuna'];

  final typeMap = <String, String>{
    'consultation': 'consulta',
    'deworming': 'desparasitación',
    'grooming': 'grooming',
    'vaccination': 'vacuna',
  };

  @override
  void onInit() {
    super.onInit();
    getNextDate();
  }

  getNextDate() => _getNextDate();

  _getNextDate() async {
    listacitas.clear();
    var dato = await nextDate.getNextDate(petC.mascotaId);
    listacitas.addAll(dato);
    cargando.value = false;
  }
}
