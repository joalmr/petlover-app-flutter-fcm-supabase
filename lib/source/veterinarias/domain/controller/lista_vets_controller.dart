import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/_global/_global_controller.dart';
import 'package:proypet/source/veterinarias/data/model/establecimiento_short_model.dart';
import 'package:proypet/source/veterinarias/data/service/establishment_service.dart';
import 'filtra_vets_controller.dart';

class VeterinariasController extends GetxController {
  final vetService = EstablishmentService();

  var vetLocales = <EstablishmentModelList>[].obs;
  var temp = <EstablishmentModelList>[].obs;
  
  List<int> listaFiltros = [];
  RxInt respVets = 0.obs;
  RxBool loading = true.obs;

  var favoriteVets = <EstablishmentModelList>[].obs;

  final global = Get.find<GlobalController>();

  // prefUser.favoritesVets

  bool ordena = false;

  ScrollController scrollController = new ScrollController();

  @override
  void onInit() {
    super.onInit();

    if (prefUser.hasToken()) {
      getVets();
      getFavorites();
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getVets();
    ordena = false;
    return null;
  }

  getFavorites() => _getFavorites();
  _getFavorites() async {
    var resp = await vetService.getVets([]);
    final List<EstablishmentModelList> listaVets = resp['establecimientos'];

    favoriteVets.clear();

    listaVets.forEach((element) {
      if(prefUser.favoritesVets.contains(element.id)){
        favoriteVets.add(element);
      }
    });
  }

  getVets() => _getVets();
  Future<void> _getVets() async {
    loading.value = true;
    var resp = await vetService.getVets(listaFiltros);
    List<EstablishmentModelList> listaVets = resp['establecimientos'];
    respVets.value = resp['code']; // == 200
    if (respVets.value == 200) {
      vetLocales.clear();
      vetLocales.addAll(listaVets);

      temp.clear();
      temp.addAll(listaVets);
    }
    loading.value = false;
  }

  orderVets() {
    ordena = !ordena;
    if (ordena) {
      vetLocales.sort();
    } else {
      vetLocales.clear();
      vetLocales.addAll(temp);
    }
  }

  bool get gps => respVets.value == 200;

  filtra() {
    final f = Get.find<FiltraVetsController>();
    f.filtrar();
  }
}
