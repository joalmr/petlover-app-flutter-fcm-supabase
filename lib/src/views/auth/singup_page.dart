import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/login/login_model.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/fadeView.dart';

import 'package:proypet/src/views/components/verify_page.dart';
import 'package:proypet/src/views/components/wave_clipper.dart';
import 'package:proypet/src/services/user_provider.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userProvider = UserProvider();
  UserDato user = UserDato();
  bool btnBool = true;

  bool clave = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: colorMain,
            elevation: 0,
          )),
      body: FadeView(
        child: Stack(
          children: <Widget>[
            Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  WaveClipperOut(120.0),
                  SizedBox(height: 10),
                  Center(
                    child: Text('Bienvenido a Proypet', style: Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 2).copyWith(fontSize: 24.0)),
                  ),
                  Center(
                    child: Text('Crear cuenta', style: Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 2)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormularioText(
                      hintText: 'Nombre',
                      icon: Icons.person,
                      obscureText: false,
                      onSaved: (value) => user.name = value,
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
                      onSaved: (value) => user.lastname = value,
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
                      onSaved: (value) => user.email = value,
                      textCap: TextCapitalization.none,
                      valorInicial: null,
                      boardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormularioText(
                      hintText: 'Contraseña',
                      icon: Icons.lock,
                      iconSuf: InkWell(
                        child: Icon(!clave ? Icons.visibility_off : Icons.visibility),
                        onTap: () {
                          setState(() {
                            clave = !clave;
                          });
                        },
                      ),
                      obscureText: clave,
                      onSaved: (value) => user.password = value,
                      textCap: TextCapitalization.none,
                      valorInicial: null,
                      boardType: TextInputType.text,
                    ),
                  ),
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
                    child: buttonPri('Registrarse', btnBool ? _onSaved : null),
                  ),
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
  }

  _onSaved() async {
    setState(() {
      btnBool = false;
      formKey.currentState.save();
    });

    if (user.name.trim() == "" || user.lastname.trim() == "" || user.email.trim() == "" || user.password.trim() == "") {
      mostrarSnackbar("Debe completar los campos", colorRed);
      Timer(Duration(milliseconds: 1500), () {
        setState(() => btnBool = true);
      });
    } else {
      if (user.password.length < 5) {
        mostrarSnackbar("La contraseña debe ser no menor a 5 dígitos", colorRed);
        Timer(Duration(milliseconds: 1500), () {
          setState(() => btnBool = true);
        });
      } else {
        bool resp = await userProvider.registerUser(user);
        if (resp) {
          Get.to(VerifyPage(textomail: user.email));
        } else {
          mostrarSnackbar("No se registró el usuario, correo existente", colorRed);
          Timer(Duration(milliseconds: 1500), () {
            setState(() => btnBool = true);
          });
        }
      }
    }
  }
}
