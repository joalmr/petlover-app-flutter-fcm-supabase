import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/booking/booking_home.dart';
import 'package:proypet/src/data/providers/pet/model/pet_model.dart';
import 'package:proypet/src/data/providers/user/model/user_model.dart';
import 'package:proypet/src/data/services/pet/pet_service.dart';
import 'package:proypet/src/data/services/summary_service.dart';
import 'package:proypet/src/data/services/user/user_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class HomeController extends GetxController {
  final summaryRepository = SummaryService();
  final userService = UserService();
  final petService = PetService();

  Rx<UserModel2> _usuario = UserModel2().obs;
  set usuario(UserModel2 value) => _usuario.value = value;
  UserModel2 get usuario => _usuario.value;

  RxBool loading = true.obs;

  RxList<BookingHome> atenciones = List<BookingHome>().obs;
  RxList<MascotaModel2> mascotas = List<MascotaModel2>().obs;

  bool get sinAtenciones => atenciones.length == 0;
  bool get sinMascotas => mascotas.length == 0;

  final _prefs = new PreferenciasUsuario();

  void volver() => Get.back();

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getSummary();
    return null;
  }

  getUsuario() => _getUsuario();

  _getUsuario() async {
    usuario = await userService.getUser();
  }

  @override
  void onInit() {
    super.onInit();
    if (_prefs.hasToken()) {
      getUsuario();
      getSummary();
    }
  }

  void getSummary() {
    _summary();
  }

  Future<void> _summary() async {
    var resp = await summaryRepository.getUserSummary();
    var pets = await petService.getPets();

    mascotas.clear();
    mascotas.addAll(pets);

    atenciones.clear();
    DateTime now = DateTime.now();
    resp.bookings.forEach((booking) {
      var fechaAt = booking.date.split('-');
      bool vencido = false;
      if (int.parse(fechaAt[0]) < now.day &&
          int.parse(fechaAt[1]) == now.month &&
          int.parse(fechaAt[2]) == now.year) {
        vencido = true;
      }
      booking.vencido = vencido;
      atenciones.add(booking);
    });

    loading.value = false;
  }
}
