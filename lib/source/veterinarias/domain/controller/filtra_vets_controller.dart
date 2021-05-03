import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/_global/_global_controller.dart';
import 'package:proypet/source/_global/data/global_repository.dart';
import 'package:proypet/source/veterinarias/data/model/address.dart';
import 'package:proypet/source/usuario/service/address_service.dart';
import 'lista_vets_controller.dart';

class FiltraVetsController extends GetxController {
  final addressService = AddressService();
  final globalRepo = GlobalRepository();
  final vetC = Get.find<VeterinariasController>();
  final global = Get.find<GlobalController>();

  List<int> listaFiltros = [];
  String _direccion = '';
  Rx<Prediction2> __dataDireccion = Prediction2().obs;
  Rx<Prediction2> _dataDireccion = Prediction2().obs;

  String tempAddress = '';
  String tempLat = '';
  String tempLng = '';

  set _dataDireccionInt(Prediction2 value) => __dataDireccion.value = value;
  Prediction2 get _dataDireccionInt => __dataDireccion.value;

  set dataDireccion(Prediction2 value) => _dataDireccion.value = value;
  Prediction2 get dataDireccion => _dataDireccion.value;

  RxBool btnFiltra = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tempAddress = "";
    tempLat = "";
    tempLng = "";
    super.onClose();
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

  _gpsDireccion(dato) async {
    if (_direccion.isNotEmpty) {
      final datoById = await globalRepo.getLatLngByPlaceId(dato.placeId);
      final location = datoById.result.geometry.location;
      double lat = location.lat;
      double lng = location.lng;

      prefUser.position = "$lat,$lng";
      prefUser.ubicacion = _direccion;
      tempAddress = _direccion;
      tempLat = lat.toString();
      tempLng = lng.toString();
    }
  }

  filtrar() => _filtrar();
  _filtrar() {
    vetC.listaFiltros.clear();
    vetC.listaFiltros.addAll(listaFiltros);

    dataDireccion = _dataDireccionInt;
    if (_direccion.isNotEmpty) {
      global.ubicacion = _direccion;
    }
    if (tempAddress.isNotEmpty && tempLat.isNotEmpty && tempLng.isNotEmpty)
      addressService.setAddress(
        tempAddress,
        tempLat,
        tempLng,
      );

    vetC.getVets();
    vetC.listaFiltros.clear();
    vetC.listaFiltros.addAll(listaFiltros);

    tempAddress = "";
    tempLat = "";
    tempLng = "";

    Get.offAllNamed('nav/lista');
  }
}
