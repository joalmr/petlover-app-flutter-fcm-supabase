import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/text_field.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';

class SingupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          WaveClipper(300.0,120.0),
          SizedBox(height: 10),
          Center(
            child: Text('Registro',
              style: TextStyle(
                fontSize: 24.0, 
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(89, 74, 70, 0.75)
              )
            ),
          ),
          SizedBox(height: 20),
          FormControl().textfield('Nombre', Icons.person, false),
          SizedBox(height: 20),
          FormControl().textfield('Apellido', Icons.person, false),
          SizedBox(height: 20),
          FormControl().textfield('Email', Icons.mail, false),
          SizedBox(height: 20),
          FormControl().textfield('Contraseña', Icons.lock, true),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text.rich(
              TextSpan(
                text: 'Acepto los ', // default text style
                children: <TextSpan>[
                  TextSpan(text: 'Términos y Condiciones.',style: TextStyle(color: Colors.blue,fontSize: 15.0,fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text.rich(
              TextSpan(
                text: 'Acepto las ', // default text style
                children: <TextSpan>[
                  TextSpan(text: 'Políticas de Privacidad y Protección de Datos Personales.',style: TextStyle(color: Colors.blue,fontSize: 15.0,fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          FormControl().buttonPri('Registrarse', (){}),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

}