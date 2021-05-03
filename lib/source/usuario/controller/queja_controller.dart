import 'package:get/get.dart';
import 'package:proypet/class/mailing.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';


class QuejaController extends GetxController {
  final sendMail = Mailing();
  final homeC = Get.find<HomeController>();

  RxString _queja = '1'.obs;
  RxString _descripcion = ''.obs;

  RxBool envia = false.obs;

  set queja(String value) => _queja.value = value;
  String get queja => _queja.value;

  set descripcion(String value) => _descripcion.value = value;
  String get descripcion => _descripcion.value;

  @override
  void onInit() {
    super.onInit();
    envia.value = false;
  }

  enviarQueja() => _enviarQueja();

  final quejaArray = [
    null,
    'Mala atención del establecimiento',
    'Me dieron menos puntos de los que pagué',
    'Monto pagado diferente al registrado',
    'Mi veterinaria no está en la app',
    'No confirmó mi reserva',
    'Me atendieron y no me registraron',
    'La aplicación falla',
    'Otro',
  ];

  _enviarQueja() async {
    final usuario = homeC.usuario;

    if (descripcion.isEmpty) {
      mostrarSnackbar(
        "Debe completar los campos",
        colorRed,
      );
    } else {
      String asunto = quejaArray[int.parse(queja)];
      String body = '''
      <strong>Enviado por ${usuario.name} ${usuario.lastname} | ${usuario.email}</strong>
      <br/>
      $descripcion
      ''';

      sendMail.mailing(asunto, body);
      envia.value = true;
    }
  }
}
