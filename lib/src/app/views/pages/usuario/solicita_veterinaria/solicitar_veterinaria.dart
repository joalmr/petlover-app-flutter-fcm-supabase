import 'package:flutter/material.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';

class SolicitaVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Solicitar Veterinaria', null),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          FormularioText(
            labelText: 'Nombre de veterinaria',
            textCap: TextCapitalization.sentences,
          ),
          FormularioText(
            labelText: 'Distrito',
            textCap: TextCapitalization.sentences,
          ),
          FormularioText(
            labelText: 'Teléfono',
            boardType: TextInputType.phone,
            hintText: '(Opcional)',
          ),
          SizedBox(height: 10),
          buttonPri('Enviar', () {}),
        ],
      ),
    );
  }
}
