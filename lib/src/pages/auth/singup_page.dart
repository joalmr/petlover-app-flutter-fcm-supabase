import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/login/login_model.dart';
import 'package:proypet/src/shared/form_control/button_primary.dart';
import 'package:proypet/src/shared/form_control/text_from.dart';
import 'package:proypet/src/shared/snackbar.dart';
import 'package:proypet/src/shared/wave_clipper.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userProvider=UserProvider();
  UserDato user = UserDato();
  bool btnBool = true;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: colorMain,
          elevation: 0,
        )
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                WaveClipperOut(120.0),
                SizedBox(height: 10),
                Center(
                  child: Text('Bienvenido a Proypet',
                    style: TextStyle(
                      fontSize: 24.0, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(89, 74, 70, 0.75)
                    )
                  ),
                ),
                Center(
                  child: Text('Crear cuenta',
                    style: TextStyle(
                      fontSize: 16.0, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(89, 74, 70, 0.75)
                    )
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: textForm('Nombre', Icons.person, false, (value)=>user.name=value, TextCapitalization.words, null,
                    TextInputType.text),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: textForm('Apellido', Icons.person, false, (value)=>user.lastname=value, TextCapitalization.words, null,
                    TextInputType.text),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: textForm('Email', Icons.alternate_email, false, (value)=>user.email=value, TextCapitalization.none, null,
                    TextInputType.text),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: textForm('Contraseña', Icons.lock, true, (value)=>user.password=value, TextCapitalization.none, null,
                    TextInputType.text),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text.rich(
                    TextSpan(
                      text: 'Al registrarse en Proypet, acepta los ', // default text style
                      children: <TextSpan>[
                        TextSpan(text: 'Términos y Condiciones',
                          style: TextStyle(color: colorBlue,fontWeight: FontWeight.bold),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { 
                              launch('https://proypet.com/terminos');
                          },
                        ),
                        TextSpan(text: ' y ',style: TextStyle()),
                        TextSpan(text: 'Políticas de Privacidad y Protección de Datos Personales.',
                          style: TextStyle(color: colorBlue,fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          )
        ],
      ),
    );
  }

  _onSaved() async {
    setState(() {
      btnBool = false;
      formKey.currentState.save();
    });

    if(user.name.trim()=="" || user.lastname.trim()=="" || user.email.trim()=="" || user.password.trim()==""){
      mostrarSnackbar("Debe completar los campos",colorRed,scaffoldKey);
      Timer(Duration(milliseconds: 1500), (){
        setState(() { btnBool = true; });
      });
    }
    else{
      if(user.password.length<5){
        mostrarSnackbar("La contraseña debe ser no menor a 5 dígitos",colorRed,scaffoldKey);
        Timer(Duration(milliseconds: 1500), (){
          setState(() { btnBool = true; });
        });
      }
      else{
        bool resp = await userProvider.registerUser(user);
        if(resp){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return FadeIn(
                child: AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  title: Text('Gracias por registrarte'),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Te hemos enviado un correo electrónico para confirmar la cuenta'),
                  ),
                ),
              );
            }
          );

          Timer(Duration(milliseconds: 3500), (){
            Navigator.of(context).popUntil((route) => route.isFirst);
          });
          
        }
        //Navigator.of(context).pushNamedAndRemoveUntil('/login', ModalRoute.withName('/login')); //
        else{
          mostrarSnackbar("No se registró el usuario, correo existente",colorRed,scaffoldKey);
          Timer(Duration(milliseconds: 1500), (){
            setState(() { btnBool = true; });
          });
        }
      }
      
    }
  }
}