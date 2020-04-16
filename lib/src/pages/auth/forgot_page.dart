import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';
import 'package:proypet/src/providers/user_provider.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final loginProvider = UserProvider();
  String val= "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            WaveClipper(300.0,120.0),
            SizedBox(height: 10.0),
            Center(
              child: Text('Olvidé mi contraseña',
                style: TextStyle(
                  fontSize: 24.0, 
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(89, 74, 70, 0.75)
                )
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text('Se le enviará un correo electrónico para que reestablezca su contraseña.')
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Email', Icons.alternate_email, false, (value)=>val=value, TextCapitalization.none, null,
                TextInputType.text),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: buttonPri('Enviar', _forgot),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  _forgot() async {
    formKey.currentState.save();
    setState(() { });

    bool resp = await loginProvider.forgotPassword(val);
    
    if(resp){
      mostrarSnackbar("Se le envío un correo electrónico a la dirección ingresada", colorMain,scaffoldKey);
    }
    if(!resp){
      mostrarSnackbar("Error ...", colorRed, scaffoldKey);
    }
  }

}