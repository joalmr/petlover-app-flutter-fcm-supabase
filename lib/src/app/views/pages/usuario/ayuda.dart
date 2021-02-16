import 'package:flutter/material.dart';
import 'package:proypet/src/app/components/navegadores/appbar.dart';
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
            'faq',
            'Preguntas frecuentes',
            Icons.help,
          ),
          listAcc(
            'feedback',
            'Ayudanos a mejorar',
            Icons.feedback,
          ),
          listAcc(
            'solicitaveterinaria',
            '¿No encuentras tu veterinaria?',
            Icons.add_business,
          ),
          listAcc(
            'enviarqueja',
            'Reportar problema',
            Icons.error,
          ),
        ],
      ),
    );
  }
}
