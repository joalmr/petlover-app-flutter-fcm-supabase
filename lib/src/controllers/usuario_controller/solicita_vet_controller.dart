import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class SolicitaVetController extends GetxController {
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
    String asunto = 'Solicita veterinaria: ${nombre.toUpperCase()}';
    final Email email = Email(
      subject: '$asunto',
      body:
          '<strong>Nombre:</strong> $nombre <br/> <strong>Ciudad:</strong> $distrito <br/> <strong>Teléfono:</strong> $telefono',
      recipients: ['info@proypet.com'],
      isHTML: true,
    );

    await FlutterEmailSender.send(email);
    envia.value = true;
  }
}
