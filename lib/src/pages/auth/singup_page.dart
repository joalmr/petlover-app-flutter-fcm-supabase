import 'package:flutter/material.dart';
import 'package:proypet/src/model/login/user_model.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';
import 'package:proypet/src/providers/user_provider.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userProvider=UserProvider();
  UserModel user = UserModel();
  bool btnBool = true;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: ListView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Nombre', Icons.person_outline, false, (value)=>user.name=value, TextCapitalization.words, null),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Apellido', Icons.person, false, (value)=>user.lastname=value, TextCapitalization.words, null),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Email', Icons.alternate_email, false, (value)=>user.email=value, TextCapitalization.none, null),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Contraseña', Icons.lock_outline, true, (value)=>user.password=value, TextCapitalization.none, null),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: buttonPri('Registrarse', btnBool ? _onSaved : null),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  _onSaved() async {
    setState(() {
      formKey.currentState.save();
    });

    if(user.name.trim()=="" || user.lastname.trim()=="" || user.email.trim()=="" || user.password==""){
      mostrarSnackbar("Debe completar los campos",colorRed,scaffoldKey);
    }
    else{
      bool resp = await userProvider.registerUser(user);
      if(resp) Navigator.pop(context); //Navigator.of(context).pushNamedAndRemoveUntil('/login', ModalRoute.withName('/login')); //
      else mostrarSnackbar("No se registró el usuario, correo existente",colorRed,scaffoldKey);
    }
  }
}