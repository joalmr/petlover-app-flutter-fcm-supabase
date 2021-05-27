import 'package:get/get.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/booking/model/booking_model.dart';
import 'package:proypet/source/home/data/service/summary_service.dart';
import 'package:proypet/source/mascota/model/pet_model.dart';
import 'package:proypet/source/notificaciones/provider/notification_provider.dart';
import 'package:proypet/source/notificaciones/service/notification_service.dart';
import 'package:proypet/source/usuario/model/user_model.dart';
import 'package:proypet/source/booking/service/booking_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';
import 'package:proypet/source/usuario/service/user_service.dart';
import 'package:proypet/utils/error.dart';
import 'package:proypet/utils/regex.dart';

class HomeController extends GetxController {
  final summaryRepository = SummaryService();
  final userService = UserService();
  final petService = PetService();
  final bookingService = BookingService();
  final _notificaService = NotificationService();

  Rx<UserModel2> usuario = UserModel2().obs;
  // set usuario(UserModel2 value) => _usuario.value = value;
  // UserModel2 get usuario => _usuario.value;

  RxBool loading = true.obs;

  var telefono = "".obs;

  var atenciones = <BookingModel>[].obs;
  var mascotas = <MascotaModel2>[].obs;
  var notificacionesGroup = <GroupNoti>[].obs;

  void volver() => Get.back();

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getSummary();
    return null;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    initApp();
  }

  initApp() async {
    if (prefUser.hasToken()) {
      await getUsuario();
      await getSummary(); 
    }
  }

  getUsuario() => _getUsuario();

  _getUsuario() async {
    print('**');
    try {
      usuario.value = await userService.getUser();
    } catch (ex) {
      errorInesperado();
    }
  }

  onPhone()=>_onPhone();
  void _onPhone() async {
    if (telefono.value!=null && telefono.value.trim()!='') {
      bool phone = phoneRegex(telefono.value);
      if (phone) {
        await userService.editUser(usuario.value.name, usuario.value.lastname, telefono.value);
        getUsuario();
        telefono.value='';
      } else {
        mostrarSnackbar('Número telefónico inválido', colorRed);
      }
    } else {
      mostrarSnackbar('Número telefónico inválido', colorRed);
    }
  }

  Future<void> getSummary() async {
    loading.value = true;

    notificacionesGroup.clear();
    final respGroup = await _notificaService.getNotificacionGroup();
    notificacionesGroup.addAll(respGroup);
    await _summary();
    
    if(mascotas.length==0){
      await Get.offNamed('mascota/agregar');
    }
    loading.value = false;
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
    } catch (ex) {
      // loading.value = false;
      errorInesperado();
    }
  }
}
