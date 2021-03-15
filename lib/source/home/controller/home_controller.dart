import 'package:get/get.dart';
import 'package:proypet/source/booking/model/booking_model.dart';
import 'package:proypet/source/mascota/model/pet_model.dart';
import 'package:proypet/source/usuario/model/user_model.dart';
import 'package:proypet/source/booking/service/booking_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';
import 'package:proypet/source/home/service/summary_service.dart';
import 'package:proypet/source/usuario/service/user_service.dart';
import 'package:proypet/utils/error.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

class HomeController extends GetxController {
  final summaryRepository = SummaryService();
  final userService = UserService();
  final petService = PetService();
  final bookingService = BookingService();

  Rx<UserModel2> _usuario = UserModel2().obs;
  set usuario(UserModel2 value) => _usuario.value = value;
  UserModel2 get usuario => _usuario.value;

  RxBool loading = true.obs;

  RxList<BookingModel> atenciones = <BookingModel>[].obs;
  RxList<MascotaModel2> mascotas = <MascotaModel2>[].obs;

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

  @override
  void onInit() {
    super.onInit();

    if (_prefs.hasToken()) {
      getUsuario();
      getSummary();
    }
  }

  getUsuario() => _getUsuario();

  _getUsuario() async {
    try {
      usuario = await userService.getUser();
    } catch (ex) {
      errorInesperado();
    }
  }

  void getSummary() {
    _summary();
  }

  Future<void> _summary() async {
    try {
      var pets = await petService.getPets();
      var bookings = await bookingService.getBookings();

      mascotas.clear();
      mascotas.addAll(pets);

      atenciones.clear();
      DateTime now = DateTime.now();
      bookings.forEach((BookingModel booking) {
        var fechaAt = booking.bookingDatetime;

        if (fechaAt.day < now.day &&
            fechaAt.month == now.month &&
            fechaAt.year == now.year) {
          booking.pastDate = true;
        }

        atenciones.add(booking);
      });

      loading.value = false;
    } catch (ex) {
      loading.value = false;
      errorInesperado();
    }
  }
}
