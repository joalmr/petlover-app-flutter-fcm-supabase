import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/model/maps/address.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import '../_global_controller.dart';
import 'lista_vets_controller.dart';

class FiltraVetsController extends GetxController {
  final _prefs = new PreferenciasUsuario();
  final vetC = Get.find<VeterinariasController>();
  final global = Get.find<GlobalController>();
  //
  List<int> listaFiltros = [];
  String _direccion = ''; //''.obs;
  Rx<Prediction2> __dataDireccion = Prediction2().obs;
  Rx<Prediction2> _dataDireccion = Prediction2().obs;
  // Prediction2 dataDireccion = Prediction2();

  // set direccion(String value) => _direccion.value = value;
  // String get direccion => _direccion.value;

  set _dataDireccionInt(Prediction2 value) => __dataDireccion.value = value;
  Prediction2 get _dataDireccionInt => __dataDireccion.value;

  set dataDireccion(Prediction2 value) => _dataDireccion.value = value;
  Prediction2 get dataDireccion => _dataDireccion.value;

  @override
  void onInit() {
    super.onInit();
  }

  add2List(numero) {
    if (!listaFiltros.contains(numero))
      listaFiltros.add(numero);
    else
      listaFiltros.remove(numero);
    update();
  }

  gpsDireccion(Prediction2 data) {
    _dataDireccionInt = data;
    _direccion = data.name;
    _gpsDireccion(data);
  }

  _gpsDireccion(dato) {
    if (_direccion.trim() != "") {
      final places = new GoogleMapsPlaces(apiKey: keyMap);
      places.getDetailsByPlaceId(dato.placeId).then((value) {
        Location latlng = value.result.geometry.location;
        _prefs.position = "${latlng.lat},${latlng.lng}";
        _prefs.ubicacion = _direccion;
      });
    }
  }

  //
  filtrar() => _filtrar();

  _filtrar() {
    vetC.listaFiltros.clear();
    vetC.listaFiltros.addAll(listaFiltros);
    //
    dataDireccion = _dataDireccionInt;
    global.ubicacion = _direccion;

    vetC.getVets();
    vetC.listaFiltros.clear();
    vetC.listaFiltros.addAll(listaFiltros);
    Get.offAllNamed('navLista');
  }
}
