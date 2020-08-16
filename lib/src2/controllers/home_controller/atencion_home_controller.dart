import 'package:get/get.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/data/services/booking_service.dart';

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
    await Get.toNamed('navLista');
  }

  void agregarMascota() {
    _agregarMascota();
  }

  Future<void> _agregarMascota() async {
    await Get.toNamed('agregarmascota');
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
