import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/styles/styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null,'Editar usuario',null),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
          children: <Widget>[
            Text('Contraseña actual'),
            SizedBox(height: 10.0,),
            textForm('Ingrese contraseña actual', Icons.person, true, (value)=>passAntigua=value, TextCapitalization.sentences, null,TextInputType.text),
            SizedBox(height: 15.0,),
            Text('Nueva contraseña'),
            SizedBox(height: 10.0,),
            textForm('Ingrese contraseña nueva', Icons.person, true, (value)=>passNueva=value, TextCapitalization.sentences, null,TextInputType.text),
            SizedBox(height: 35.0,),
            Center(
              child: buttonPri('Cambiar contraseña', _changePassword ) //()=>agregarDialog()
            )
          ],
        ),
      ),
    );
  }

  _changePassword() async {
    setState(() {
      formKey.currentState.save();
      // btnBool = false;      
    });
    bool resp = await userProvider.changePassword(passAntigua, passNueva);
    if(resp){
      mostrarSnackbar('Se cambió la contraseña.', colorMain, scaffoldKey);
    }
    else{
      mostrarSnackbar('No se cambió la contraseña.', colorRed, scaffoldKey);
    }
  }
}