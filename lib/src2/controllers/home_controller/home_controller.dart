import 'package:get/get.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src2/data/services/summary_service.dart';

class HomeController extends GetxController {
  final summaryRepository = SummaryService();
  //
  RxString _usuario = ''.obs;
  set usuario(String value) => _usuario.value = value;
  String get usuario => _usuario.value;

  RxBool loading = true.obs;

  RxList<BookingHome> atenciones = List<BookingHome>().obs;
  RxList<MascotaModel2> mascotas = List<MascotaModel2>().obs;

  // _init() {
  //   ever(_usuario, (_) {
  //     print('cambio name');
  //   });
  // }

  bool get sinAtenciones => atenciones.length == 0;
  bool get sinMascotas => mascotas.length == 0;

  void volver() => Get.back();

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getSummary();
    return null;
  }

  void getSummary() {
    _summary();
  }

  Future<void> _summary() async {
    var resp = await summaryRepository.getUserSummary();
    usuario = resp.user.name;
    // print('1 ' + usuario);
    mascotas.clear();
    mascotas.addAll(resp.pets);
    // print('mascotas ' + mascotas.length.toString());
    atenciones.clear(); //atenciones
    DateTime now = DateTime.now();
    resp.bookings.forEach((booking) {
      var fechaAt = booking.date.split('-');
      bool vencido = false;
      if (int.parse(fechaAt[0]) < now.day && int.parse(fechaAt[1]) == now.month && int.parse(fechaAt[2]) == now.year) {
        vencido = true;
      }
      booking.vencido = vencido;
      atenciones.add(booking);
    });
    print('atenciones ' + atenciones.length.toString());
    loading.value = false;
  }

  //
  //

}
