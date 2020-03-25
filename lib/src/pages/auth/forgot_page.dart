import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String val= "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
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
          // textfield('Email', Icons.mail, false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: textForm('Email', Icons.alternate_email, false, (value)=>val=value, TextCapitalization.none, null),
          ),
          //FormControl().textfield('Email', Icons.mail, false),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: buttonPri('Enviar',(){}),
          ),
          //FormControl().buttonPri('Enviar', (){}),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}