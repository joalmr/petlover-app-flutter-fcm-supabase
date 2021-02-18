import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/components/snackbar.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/class/mailing.dart';

class FeedbackController extends GetxController {
  final sendMail = Mailing();
  final homeC = Get.find<HomeController>();

  RxInt _stars = 1.obs;
  RxString _descripcion = ''.obs;

  RxBool envia = false.obs;

  set stars(int value) => _stars.value = value;
  int get stars => _stars.value;

  set descripcion(String value) => _descripcion.value = value;
  String get descripcion => _descripcion.value;

  @override
  void onInit() {
    super.onInit();
    envia.value = false;
  }

  enviarQueja() => _enviarQueja();

  _enviarQueja() async {
    final usuario = homeC.usuario;

    if (descripcion.isEmpty) {
      mostrarSnackbar(
        "Debe completar los campos",
        colorRed,
      );
    } else {
      String asunto = 'Feedback';
      String body = '''
      <strong>Enviado por ${usuario.name} ${usuario.lastname} | ${usuario.email}</strong>
      <br/>
      ⭐️ $stars estrellas
      <br/>
      $descripcion
      ''';

      sendMail.mailing(asunto, body);
      envia.value = true;
    }
  }
}
