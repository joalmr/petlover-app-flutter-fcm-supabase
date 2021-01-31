import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class QuejaController extends GetxController {
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
    'Otro',
  ];

  _enviarQueja() async {
    String asunto = quejaArray[int.parse(queja)];
    final Email email = Email(
      subject: '$asunto',
      body: '$descripcion',
      recipients: ['info@proypet.com'],
      isHTML: true,
    );

    await FlutterEmailSender.send(email);
    envia.value = true;
  }
}
