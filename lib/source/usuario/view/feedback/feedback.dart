import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/components/form_control/button_primary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/usuario/controller/feedback_controller.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<FeedbackController>(
      init: FeedbackController(),
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            texto: 'Ayuda',
            acc: null,
          ),
          body: _.envia.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Gracias por ayudarnos a mejorar con tu comentario 🐶🐱',
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
                    Text('¿Cómo calificarías tu experiencia en la app?'),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      glow: false,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: colorYellow,
                      ),
                      onRatingUpdate: (rating) => _.stars = rating.round(),
                    ),
                    FormularioText(
                      labelText:
                          '¿Qué es lo que cambiarías, mejorarías o te gustaría hacer/encontrar en Proypet?',
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
      },
    );
  }
}
