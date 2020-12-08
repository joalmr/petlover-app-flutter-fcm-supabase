import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_short_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import '../_global_controller.dart';
import 'filtra_vets_controller.dart';

class VeterinariasController extends GetxController {
  final vetService = EstablecimientoService();
  RxList<EstablecimientoShortModel> vetLocales =
      List<EstablecimientoShortModel>().obs;
  RxList<EstablecimientoShortModel> temp =
      List<EstablecimientoShortModel>().obs;
  List<int> listaFiltros = [];
  RxInt respVets = 0.obs;
  RxBool loading = true.obs;

  final global = Get.find<GlobalController>();
  final _prefs = new PreferenciasUsuario();

  // int _pageSize = 20;

  ScrollController scrollController = new ScrollController();

  @override
  void onInit() {
    super.onInit();

    if (_prefs.hasToken()) {
      getVets();
    }

    // scrollController.addListener(() {
    //   // print('position ${scrollController.position.pixels}');
    //   // print('maximo ${scrollController.position.maxScrollExtent}');
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     // _pageSize = _pageSize + 10;
    //     // getVets();
    //     // scrollController.position.maxScrollExtent;
    //   }
    // });
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
    return null;
  }

  // getFive() {
  //   for (int i = 0; i < 5; i++) {
  //     _getVets();
  //   }
  // }

  getVets() => _getVets();

  Future<void> _getVets() async {
    loading.value = true;
    var resp = await vetService.getVets(listaFiltros);
    List<EstablecimientoShortModel> listaVets = resp['establecimientos'];
    respVets.value = resp['code']; // == 200
    if (respVets.value == 200) {
      vetLocales.clear();
      temp.clear();
      vetLocales.addAll(listaVets);
      temp.addAll(listaVets);
    }
    loading.value = false;
  }

  bool ordena = false;
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
