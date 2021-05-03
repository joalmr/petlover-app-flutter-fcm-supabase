import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/usuario/controller/solicita_vet_controller.dart';
import 'package:share/share.dart';

class SolicitaVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SolicitaVetController>(
        init: SolicitaVetController(),
        builder: (_) {
          return Scaffold(
            appBar: appbar(null, 'Solicitar Veterinaria', null),
            body: _.envia.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        height: 200,
                        image: AssetImage('images/cat_dog/invitation.png'),
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Gracias por solicitar tu veterinaria',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Nos contactarémos con ellos',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      btnSecondary(
                        text: 'Volver',
                        onPressed: () => Get.back(),
                        color: colorMain,
                      ),
                      SizedBox(height: 50),
                      FlatButton(
                        onPressed: () => Share.share(
                            'Hola! Te invito a que seas parte de Proypet❤️ Entérate más en: https://proypet.com/veterinarias',
                            subject: 'Se parte de Proypet'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: colorMain,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Invitar a mi veterinaria',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: colorMain,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 20.0,
                        ),
                        shape: shape10,
                      ),
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      Text(
                        'Ingresa los datos de tu veterinaria favorita para que forme parte de Proypet',
                        style: TextStyle(
                            color: colorMain, fontWeight: FontWeight.bold),
                      ),
                      FormularioText(
                        labelText: 'Nombre de veterinaria',
                        textCap: TextCapitalization.sentences,
                        onChanged: (value) => _.nombre = value,
                      ),
                      FormularioText(
                        labelText: 'Distrito',
                        textCap: TextCapitalization.sentences,
                        onChanged: (value) => _.distrito = value,
                      ),
                      FormularioText(
                        labelText: 'Teléfono',
                        boardType: TextInputType.phone,
                        hintText: '(Opcional)',
                        onChanged: (value) => _.telefono = value,
                      ),
                      SizedBox(height: 10),
                      btnPrimary(
                        text: 'Enviar',
                        onPressed: _.enviarSolicitud,
                      ),
                    ],
                  ),
          );
        });
  }
}
