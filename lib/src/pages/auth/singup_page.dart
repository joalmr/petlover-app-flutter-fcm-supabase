import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_field.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  String val="";

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
          //FormControl().textfield('Nombre', Icons.person, false),
          // textfield('Nombre', Icons.person, false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: textForm('Nombre', Icons.person_outline, false, (value)=>val=value, TextCapitalization.words, null),
          ),
          SizedBox(height: 20),
          //FormControl().textfield('Apellido', Icons.person, false),
          // textfield('Apellido', Icons.person, false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: textForm('Apellido', Icons.person, false, (value)=>val=value, TextCapitalization.words, null),
          ),
          SizedBox(height: 20),
          //FormControl().textfield('Email', Icons.mail, false),
          // textfield('Email', Icons.mail, false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: textForm('Email', Icons.alternate_email, false, (value)=>val=value, TextCapitalization.none, null),
          ),
          SizedBox(height: 20),
          //FormControl().textfield('Contraseña', Icons.lock, true),
          // textfield('Contraseña', Icons.lock, true),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: textForm('Contraseña', Icons.lock_outline, true, (value)=>val=value, TextCapitalization.none, null),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text.rich(
              TextSpan(
                text: 'Acepto los ', // default text style
                children: <TextSpan>[
                  TextSpan(text: 'Términos y Condiciones.',style: TextStyle(color: colorBlue,fontSize: 15.0,fontWeight: FontWeight.bold))
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
                  TextSpan(text: 'Políticas de Privacidad y Protección de Datos Personales.',style: TextStyle(color: colorBlue,fontSize: 15.0,fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          //FormControl().buttonPri('Registrarse', (){}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: buttonPri('Registrarse', (){}),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}