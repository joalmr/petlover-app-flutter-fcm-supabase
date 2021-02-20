import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Mailing {
  mailing(String asunto, String html) async {
    String username = 'joalmr@gmail.com';
    String password = 'g8vGmdfIUAMcFH1Q';
    var smtpServer = new SmtpServer(
      'smtp-relay.sendinblue.com',
      port: 587,
      username: username,
      password: password,
    );

    final message = Message()
      ..from = Address('no-reply@proypet.com', 'by App')
      ..recipients.add('info@proypet.com')
      ..subject = asunto
      // ..text = description
      ..html = html;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print(e);
    }
  }
}
