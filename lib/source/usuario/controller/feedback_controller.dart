import 'package:get/get.dart';
import 'package:proypet/class/mailing.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';


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
