import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'package:proypet/src/styles/styles.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final userProvider = new UserProvider();

  String passAntigua;
  String passNueva;

  bool clickPassword = true;
  bool clave1 = true;
  bool clave2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null, 'Cambiar contraseña', null),
      body: FadeViewSafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 20.0), //.symmetric(horizontal: 25.0,vertical: 10.0),
            children: <Widget>[
              FormularioText(
                labelText: 'Contraseña actual',
                hintText: 'Ingrese contraseña actual',
                icon: Icons.lock,
                iconSuf: InkWell(
                  child:
                      Icon(!clave1 ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      clave1 = !clave1;
                    });
                  },
                ),
                obscureText: clave1,
                onSaved: (value) => passAntigua = value,
                textCap: TextCapitalization.none,
                valorInicial: null,
                boardType: TextInputType.text,
              ),
              FormularioText(
                labelText: 'Nueva contraseña',
                hintText: 'Ingrese contraseña nueva',
                icon: Icons.lock,
                iconSuf: InkWell(
                  child:
                      Icon(!clave2 ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      clave2 = !clave2;
                    });
                  },
                ),
                obscureText: clave2,
                onSaved: (value) => passNueva = value,
                textCap: TextCapitalization.none,
                valorInicial: null,
                boardType: TextInputType.text,
              ),
              SizedBox(height: 25.0),
              Center(
                  child: buttonPri(
                      'Cambiar contraseña',
                      clickPassword
                          ? _changePassword
                          : null) //()=>agregarDialog()
                  )
            ],
          ),
        ),
      ),
    );
  }

  _changePassword() async {
    setState(() {
      clickPassword = false;
      formKey.currentState.save();
      // btnBool = false;
    });
    int resp = await userProvider.changePassword(passAntigua, passNueva);
    if (resp == 200) {
      mostrarSnackbar('Se cambió la contraseña.', colorMain, scaffoldKey);
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          clickPassword = true;
        });
      });
    } else if (resp == 204) {
      mostrarSnackbar('Error, la contraseña debe ser no menor a 5 dígitos.',
          colorRed, scaffoldKey);
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          clickPassword = true;
        });
      });
    } else if (resp == 401) {
      mostrarSnackbar(
          'Error, la contraseña actual es incorrecta.', colorRed, scaffoldKey);
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          clickPassword = true;
        });
      });
    }
  }
}
