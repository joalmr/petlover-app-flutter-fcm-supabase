import 'dart:io';
import 'package:flutter/material.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/list_cuenta.dart';

class AyudaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Ayuda',
        acc: null,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          listAcc(
            'help/faq',
            'Preguntas frecuentes',
            Icons.help,
          ),
          listAcc(
            'help/feedback',
            'Ayudanos a mejorar',
            Icons.feedback,
          ),
          listAcc(
            'help/solicitavet',
            '¿No encuentras tu veterinaria?',
            Icons.add_business,
          ),
          listAcc(
            'help/enviarqueja',
            'Reportar problema',
            Icons.error,
          ),
          listAccFn(
            'Actualizar app',
            Icons.upload_rounded,
            () => Platform.isIOS
                ? launch('https://apps.apple.com/pe/app/proypet/id1529231253')
                : launch(
                    'https://play.google.com/store/apps/details?id=com.proypet.user'),
          ),
        ],
      ),
    );
  }
}
