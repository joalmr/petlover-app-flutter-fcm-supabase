import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/form_control/button_primary.dart';
import 'package:proypet/src/app/components/form_control/text_from.dart';
import 'package:proypet/src/app/components/transition/fadeView.dart';
import 'package:proypet/src/app/components/wave_clipper.dart';
import 'package:proypet/src/controllers/auth_controller/sign_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SignController>(
      init: SignController(),
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(backgroundColor: colorMain, elevation: 0)),
          body: FadeView(
            child: Stack(
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      WaveClipperOut(120.0),
                      SizedBox(height: 10),
                      Center(
                        child: Text('Bienvenido a Proypet',
                            style: Get.textTheme.headline5
                                .apply(fontWeightDelta: 2)
                                .copyWith(fontSize: 24.0)),
                      ),
                      Center(
                        child: Text('Crear cuenta',
                            style: Get.textTheme.subtitle1
                                .apply(fontWeightDelta: 2)),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: _.singup.value
                            ? ListView(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                children: [
                                  FormularioText(
                                    hintText: 'Nombre',
                                    icon: Icons.person,
                                    obscureText: false,
                                    onChanged: (value) => _.name = value,
                                    textCap: TextCapitalization.words,
                                    valorInicial: null,
                                    boardType: TextInputType.text,
                                  ),
                                  FormularioText(
                                    hintText: 'Apellido',
                                    icon: Icons.person_outline,
                                    obscureText: false,
                                    onChanged: (value) => _.lastname = value,
                                    textCap: TextCapitalization.words,
                                    valorInicial: null,
                                    boardType: TextInputType.text,
                                  ),
                                  FormularioText(
                                    hintText: 'Email',
                                    icon: Icons.alternate_email,
                                    obscureText: false,
                                    onChanged: (value) => _.email = value,
                                    textCap: TextCapitalization.none,
                                    valorInicial: null,
                                    boardType: TextInputType.text,
                                  ),
                                  FormularioText(
                                    hintText: 'Contraseña',
                                    icon: Icons.lock,
                                    iconSuf: InkWell(
                                      child: Icon(_.passwordVisible.value
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onTap: _.togglePasswordVisibility,
                                    ),
                                    obscureText: !_.passwordVisible.value,
                                    onChanged: (value) => _.password = value,
                                    textCap: TextCapitalization.none,
                                    valorInicial: null,
                                    boardType: TextInputType.text,
                                  ),
                                  SizedBox(height: 20.0),
                                  buttonPri(
                                    'Registrarme',
                                    !_.loading.value ? _.getSignUp : null,
                                  ),
                                  buttonFlat(
                                    'Volver',
                                    () => _.singup.value = false,
                                    colorMain,
                                  ),
                                ],
                              )
                            : ListView(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                children: [
                                  Divider(
                                    indent: 65,
                                    endIndent: 65,
                                    thickness: 2.5,
                                  ),
                                  SizedBox(height: 20),
                                  btnWIcon(
                                    texto: 'Registrarme con Facebook',
                                    icono: FontAwesomeIcons.facebook,
                                    color: Color(0xFF3b5998),
                                    funtion: _.signFacebook,
                                  ),
                                  SizedBox(height: 5),
                                  btnWIcon(
                                    texto: 'Registrarme con Google',
                                    pathImage: 'images/google.png',
                                    color: Color(0xFFf1f1f1),
                                    colorText: Colors.black38,
                                    colorIcon: Colors.black38,
                                    funtion: () {},
                                  ),
                                  SizedBox(height: 5),
                                  btnWIcon(
                                    texto: 'Registrarme con correo',
                                    icono: FontAwesomeIcons.solidEnvelope,
                                    color: colorMain,
                                    funtion: () => _.singup.value = true,
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text.rich(
                                      TextSpan(
                                        text:
                                            'Al registrarse en Proypet, acepta los ',
                                        style: TextStyle(fontSize: 12),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Términos y Condiciones',
                                            style: TextStyle(
                                              color: colorBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    launch(
                                                      'https://proypet.com/terminos',
                                                    );
                                                  },
                                          ),
                                          TextSpan(
                                              text: ' y ', style: TextStyle()),
                                          TextSpan(
                                            text:
                                                'Políticas de Privacidad y Protección de Datos Personales.',
                                            style: TextStyle(
                                              color: colorBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    launch(
                                                      'https://proypet.com/politicas',
                                                    );
                                                  },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
