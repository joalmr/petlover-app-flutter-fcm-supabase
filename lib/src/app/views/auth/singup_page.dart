import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/app/views/components/wave_clipper.dart';
import 'package:proypet/src/controllers/auth/sign_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignController>(
        init: SignController(),
        builder: (_) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar(backgroundColor: colorMain, elevation: 0)),
            body: FadeView(
              child: Stack(
                children: <Widget>[
                  Form(
                    // key: formKey,
                    child: ListView(
                      children: <Widget>[
                        WaveClipperOut(120.0),
                        SizedBox(height: 10),
                        Center(
                          child: Text('Bienvenido a Proypet', style: Get.textTheme.headline5.apply(fontWeightDelta: 2).copyWith(fontSize: 24.0)),
                        ),
                        Center(
                          child: Text('Crear cuenta', style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2)),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FormularioText(
                            hintText: 'Nombre',
                            icon: Icons.person,
                            obscureText: false,
                            onChanged: (value) => _.name = value,
                            textCap: TextCapitalization.words,
                            valorInicial: null,
                            boardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FormularioText(
                            hintText: 'Apellido',
                            icon: Icons.person_outline,
                            obscureText: false,
                            onChanged: (value) => _.lastname = value,
                            textCap: TextCapitalization.words,
                            valorInicial: null,
                            boardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FormularioText(
                            hintText: 'Email',
                            icon: Icons.alternate_email,
                            obscureText: false,
                            onChanged: (value) => _.email = value,
                            textCap: TextCapitalization.none,
                            valorInicial: null,
                            boardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Obx(() => FormularioText(
                                  hintText: 'Contraseña',
                                  icon: Icons.lock,
                                  iconSuf: InkWell(
                                    child: Icon(_.passwordVisible.value ? Icons.visibility_off : Icons.visibility),
                                    onTap: _.togglePasswordVisibility,
                                  ),
                                  obscureText: !_.passwordVisible.value,
                                  onChanged: (value) => _.password = value,
                                  textCap: TextCapitalization.none,
                                  valorInicial: null,
                                  boardType: TextInputType.text,
                                ))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text.rich(
                            TextSpan(
                              text: 'Al registrarse en Proypet, acepta los ', // default text style
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Términos y Condiciones',
                                  style: TextStyle(color: colorBlue, fontWeight: FontWeight.bold),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      launch('https://proypet.com/terminos');
                                    },
                                ),
                                TextSpan(text: ' y ', style: TextStyle()),
                                TextSpan(
                                  text: 'Políticas de Privacidad y Protección de Datos Personales.',
                                  style: TextStyle(color: colorBlue, fontWeight: FontWeight.bold),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      launch('https://proypet.com/politicas');
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Obx(() => buttonPri('Registrarse', !_.loading.value ? _.getSignUp : null))),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
                  )
                ],
              ),
            ),
          );
        });
  }
}
