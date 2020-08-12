import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/provider/login_store.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/transicion/fadeView.dart';

import 'package:proypet/src/views/components/wave_clipper.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  LoginStore loginStore;

  @override
  void initState() {
    super.initState();
    loginStore = GetIt.I.get<LoginStore>();
  }

  @override
  void dispose() {
    loginStore.disposeSingUp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // key: formKey,
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
                      onChanged: (value) => loginStore.setNombre(value),
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
                      onChanged: (value) => loginStore.setApellido(value),
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
                      onChanged: (value) => loginStore.setEmail(value),
                      textCap: TextCapitalization.none,
                      valorInicial: null,
                      boardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Observer(
                        builder: (_) => FormularioText(
                              hintText: 'Contraseña',
                              icon: Icons.lock,
                              iconSuf: InkWell(
                                child: Icon(loginStore.passwordVisibleReg ? Icons.visibility_off : Icons.visibility),
                                onTap: loginStore.togglePasswordVisibilityReg,
                              ),
                              obscureText: !loginStore.passwordVisibleReg,
                              onChanged: (value) => loginStore.setPassword(value),
                              textCap: TextCapitalization.none,
                              valorInicial: null,
                              boardType: TextInputType.text,
                            )),
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
                    child: Observer(builder: (_) => buttonPri('Registrarse', !loginStore.loading ? _onSaved : null)),
                    // child: buttonPri('Registrarse', btnBool ? _onSaved : null),
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

  _onSaved() => loginStore.registraUser();
}
