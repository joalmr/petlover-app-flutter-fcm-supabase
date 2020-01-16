import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';

class ForgotPage extends StatelessWidget {

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
          FormControl().textfield('Email', Icons.mail, false),
          SizedBox(height: 30.0),
          FormControl().buttonPri('Enviar', (){}),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

}