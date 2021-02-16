import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
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
    final Email email = Email(
      subject: 'Feedback',
      body: '⭐️ $stars estrellas <br/>$descripcion',
      recipients: ['info@proypet.com'],
      isHTML: true,
    );

    await FlutterEmailSender.send(email);
    envia.value = true;
  }
}
