import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/provider/login_store.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/transicion/fadeView.dart';

import 'package:proypet/src/views/components/wave_clipper.dart';
import 'package:proypet/src/styles/styles.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  LoginStore loginStore;

  @override
  void initState() {
    super.initState();
    loginStore = GetIt.I.get<LoginStore>();
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 10.0),
                  Center(
                    child: Text('¿Olvidaste tu contraseña?', style: Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 2).copyWith(fontSize: 24.0)),
                  ),
                  SizedBox(height: 10.0),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text('Ingresa tu correo electrónico para reestablecer contraseña')),
                  SizedBox(height: 20.0),
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
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Observer(builder: (_) => buttonPri('Enviar correo electrónico', !loginStore.loading ? _forgot : null)),
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

  _forgot() => loginStore.olvideClave();
}
