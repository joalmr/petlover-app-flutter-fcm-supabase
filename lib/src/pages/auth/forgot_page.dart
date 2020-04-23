import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/styles/styles.dart';



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
                WaveClipperOut(110.0),
                SizedBox(height: 10.0),
                Center(
                  child: Text('¿Olvidaste tu contraseña?',
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
                  child: Text('Ingresa tu dirección de correo electrónico para reestablecer contraseña')
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
                  child: buttonPri('Enviar correo electrónico', _forgot),
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

  _forgot() async {
    formKey.currentState.save();
    setState(() { });

    if(val.trim()==""){
      mostrarSnackbar("Ingrese correo electrónico", colorRed, scaffoldKey);
    }
    else{
      bool resp = await loginProvider.forgotPassword(val);
      if(resp){
        mostrarSnackbar("Se le envío un correo electrónico a la dirección ingresada", colorMain,scaffoldKey);
      }
      if(!resp){
        mostrarSnackbar("Error ...", colorRed, scaffoldKey);
      }
    }    
  }

}