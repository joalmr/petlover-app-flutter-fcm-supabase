import 'package:get/get.dart';
import 'package:proypet/source/booking/service/booking_service.dart';

import 'home_controller.dart';

class BookingHomeController extends GetxController {
  final homeController = Get.find<HomeController>();
  final bookingProvider = BookingService();

  RxBool loading = true.obs;

  void volver() {
    Get.back();
  }

  void reserva() {
    _reserva();
  }

  Future<void> _reserva() async {
    await Get.toNamed('nav/notifica');
  }

  void agregarMascota() {
    _agregarMascota();
  }

  Future<void> _agregarMascota() async {
    await Get.toNamed('mascota/agregar');
  }

  void eliminaAtencion(id) {
    _eliminaAtencion(id);
    volver();
  }

  Future<void> _eliminaAtencion(id) async {
    var resp = await bookingProvider.deleteBooking(id);
    if (resp) {
      homeController.getSummary();
      loading.value = false;
    }
  }

  void detalleReservado(atencion) {
    _detalleReservado(atencion);
  }

  Future<void> _detalleReservado(atencion) async {
    await Get.toNamed('detallereservado', arguments: atencion);
  }
}
