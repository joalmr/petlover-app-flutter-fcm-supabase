import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:proypet/utils/months.dart';
import 'package:proypet/source/mascota/model/pet_model.dart';
import 'package:proypet/source/mascota/model/pet_history_model.dart';
import 'package:proypet/source/mascota/service/pet_history_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MascotaDetalleController extends GetxController {
  String mascotaId;
  final petService = new PetService();
  final petHistoryService = new PetHistoryService();

  RxBool loading = true.obs;
  RxBool loadingHistory = true.obs;

  MascotaModel2 pet;

  RxList<PetHistoryModel> petHistory = <PetHistoryModel>[].obs;
  RxList<PetHistoryModel> petAllHistory = <PetHistoryModel>[].obs;

  DateTime today = DateTime.now();

  RxString tempYear = ''.obs;
  RxString tempMonth = ''.obs; //mes[DateTime.now().month].obs;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  int scrollInit = 0;

  @override
  void onInit() {
    super.onInit();
    mascotaId = Get.arguments;
    verMiMascota();
    firstHistory();
  }

  goPosition() {
    firstHistory();
    itemScrollController.scrollTo(
      index: scrollInit,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOutCubic,
    );
  }

  firstHistory() => _firstHistory();
  Future<void> _firstHistory() async {
    int todayYear = today.year;
    int todayMonth = today.month;

    tempYear.value = todayYear.toString();
    tempMonth.value = mes[todayMonth];

    var month = todayMonth < 10 ? '0${today.month}' : todayMonth.toString();
    await historyDate(todayYear.toString(), month);
  }

  void verMiMascota() {
    _verMiMascota();
  }

  Future<void> _verMiMascota() async {
    pet = await petService.getPet(mascotaId);
    loading.value = false;
  }

  historyDate(String year, String month) => _historyDate(year, month);

  _historyDate(year, month) async {
    loadingHistory.value = true;
    petHistory.clear();
    petHistory.addAll(
        await petHistoryService.getPetHistoryDate(mascotaId, year, month));
    loadingHistory.value = false;
  }

  goToHistory() => _goToHistory();
  _goToHistory() async {
    await _verMiHistoria(mascotaId);
    Get.toNamed('historialmascota');
  }

  Future<void> _verMiHistoria(id) async {
    petAllHistory.clear();
    petAllHistory.addAll(await petHistoryService.getPetHistory(mascotaId));
  }

  // RxInt frecuenciaFood = 0.obs;
  // RxString horasFood = ''.obs;
  // RxInt frecuenciaBed = 0.obs;
  // RxInt frecuenciaFleas = 0.obs;
  // RxInt frecuenciaLitterBox = 0.obs;

  // fnFleas() => funtionFleas();
  // fnBed() => funtionBed();
  // fnLitterBox() => funtionLitterBox();
  // fnFood() => funtionFood();
}
