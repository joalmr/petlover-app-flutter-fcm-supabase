import 'package:get/get.dart';
import 'package:proypet/class/mailing.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';


class SolicitaVetController extends GetxController {
  final sendMail = Mailing();
  final homeC = Get.find<HomeController>();

  RxString _nombre = ''.obs;
  RxString _distrito = ''.obs;
  RxString _telefono = ''.obs;

  RxBool envia = false.obs;

  set nombre(String value) => _nombre.value = value;
  String get nombre => _nombre.value;

  set distrito(String value) => _distrito.value = value;
  String get distrito => _distrito.value;

  set telefono(String value) => _telefono.value = value;
  String get telefono => _telefono.value;

  @override
  void onInit() {
    super.onInit();
    envia.value = false;
  }

  enviarSolicitud() => _enviarSolicitud();

  _enviarSolicitud() async {
    final usuario = homeC.usuario;

    if (nombre.isEmpty || distrito.isEmpty) {
      mostrarSnackbar(
        "Debe completar los campos",
        colorRed,
      );
    } else {
      String asunto = 'Solicita veterinaria: ${nombre.toUpperCase()}';
      String body = '''
      <strong>Enviado por ${usuario.name} ${usuario.lastname} | ${usuario.email}</strong>
      <br/>
      <strong>Nombre:</strong> $nombre
      <br/> 
      <strong>Ciudad:</strong> $distrito
      <br/> 
      <strong>Teléfono:</strong> $telefono
      ''';

      sendMail.mailing(asunto, body);
      envia.value = true;
    }
  }
}
