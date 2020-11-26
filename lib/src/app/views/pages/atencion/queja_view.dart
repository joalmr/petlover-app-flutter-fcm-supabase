import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/controllers/atencion_controller/queja_controller.dart';

import 'quejas/lista_queja.dart';

class QuejaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<QuejaController>(
        init: QuejaController(),
        builder: (_) {
          return Scaffold(
            appBar: appBar(
              texto: 'Reportar problema',
              acc: null,
            ),
            body: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Text('Seleccione motivo'),
                SizedBox(height: 7.5),
                ddlMain(context, _.queja, quejaLista, (opt) {
                  _.queja = opt.toString();
                }),
                FormularioText(
                  labelText: 'Detalle del problema',
                  maxLines: 10,
                  textCap: TextCapitalization.sentences,
                  boardType: TextInputType.multiline,
                  onChanged: (value) => _.descripcion = value,
                ),
                SizedBox(height: 10),
                buttonPri('Enviar', _.enviarQueja),
              ],
            ),
          );
        });
  }
}
