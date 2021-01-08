import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/data/models/update/mascota/history_model.dart';
// import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/data/models/update/mascota/pet_model.dart';
// import 'package:proypet/src/models/mascota/pet_model.dart';
import 'package:proypet/src/data/services/mascota_service.dart';

class MascotaDetalleController extends GetxController {
  String mascotaId;
  final mascotaService = new MascotaService();
  RxBool loading = true.obs;

  MascotaModel2 pet;
  RxList<HistoriaModel2> history = List<HistoriaModel2>().obs;

  @override
  void onInit() {
    super.onInit();
    mascotaId = Get.arguments;
    verMiMascota();
  }

  void verMiMascota() {
    _verMiMascota();
  }

  Future<void> _verMiMascota() async {
    pet = await mascotaService.getPet(mascotaId);
    // await _verMiHistoria(mascotaId);
    loading.value = false;
  }

  //void verMiHistoria(id)
  goToHistory() => _goToHistory();
  _goToHistory() async {
    await _verMiHistoria(mascotaId);
    Get.toNamed('historialmascota');
  }

  // void verMiHistoria() {
  //   _verMiHistoria(mascotaId);
  // }

  Future<void> _verMiHistoria(id) async {
    history.clear();
    history.addAll(await mascotaService.getPetHistory(id));
  }

  fnFood() {
    RxInt page = 1.obs;
    return showDialog(
      context: Get.context,
      barrierDismissible: false,
      child: AlertDialog(
        actions: [
          Obx(
            () => buttonPri(page.value == 1 ? 'Continuar' : 'Guardar', () {
              if (page.value == 1) page.value = page.value + 1;
              print(page.value);
            }),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Alimentación',
              style: TextStyle(fontSize: 16),
            ),
            InkWell(
              borderRadius: borderRadius,
              child: Icon(Icons.close, size: 18),
              onTap: () => Get.back(),
            )
          ],
        ),
        scrollable: true,
        content: Obx(() => content(page.value)),
      ),
    );
  }

  RxInt frecuenciaComida = 0.obs;

  content(page) {
    switch (page) {
      case 1:
        return Column(
          children: [
            Text('¿Cuántas veces al día come?'),
            SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  frecuenciaComida.value = int.tryParse(value),
            ),
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Text('¿En qué horarios?'),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Ejm: 10:30,16:00,20:00',
              ),
            ),
          ],
        );
        break;
    }
  }
}
