import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/controllers/usuario_controller/queja_controller.dart';
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
            body: _.envia.value
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Gracias por reportar un problema, de ser necesario nos comunicaremos con usted',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        buttonOutLine('Volver', () => Get.back(), colorMain),
                      ],
                    ),
                  )
                : ListView(
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
