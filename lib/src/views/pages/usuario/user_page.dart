import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/login/user_model.dart';
import 'package:proypet/src/services/user_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/regex.dart';

class UserPage extends StatefulWidget {
  // const UserPage({Key key}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User user = User();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userProvider = new UserProvider();
  bool btnBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null, 'Editar usuario', null), //leadingH
      body: FutureBuilder(
          future: userProvider.getUser(),
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            } else {
              user = snapshot.data.user;
              return FadeViewSafeArea(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          FormularioText(
                            labelText: 'Nombre',
                            hintText: 'Ingrese nombre',
                            icon: Icons.person,
                            obscureText: false,
                            onSaved: (value) => user.name = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.name,
                            boardType: TextInputType.text,
                          ),
                          FormularioText(
                            labelText: 'Apellido',
                            hintText: 'Ingrese apellido',
                            icon: Icons.person,
                            obscureText: false,
                            onSaved: (value) => user.lastname = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.lastname,
                            boardType: TextInputType.text,
                          ),
                          FormularioText(
                            labelText: 'Teléfono',
                            hintText: 'Ingrese teléfono',
                            icon: Icons.phone,
                            obscureText: false,
                            onSaved: (value) => user.phone = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.phone,
                            boardType: TextInputType.phone,
                          ),
                          Text(
                            'Ingresar su teléfono es útil para que la veterinaria pueda comunicarse con usted.',
                            style: TextStyle(fontSize: sizeSmallx1),
                          ),
                          SizedBox(height: 25.0),
                          Center(child: buttonPri('Guardar cambios', btnBool ? _onEdit : null) //()=>agregarDialog()
                              )
                        ],
                      ),
                    )),
              );
            }
          }),
    );
  }

  void _onEdit() {
    setState(() {
      formKey.currentState.save();
      btnBool = false;
    });

    //&& user.phone.trim()!=""
    if (user.name.trim() == "" || user.lastname.trim() == "") {
      mostrarSnackbar('Complete los datos.', colorRed);
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          btnBool = true;
        });
      });
    } else {
      if (user.phone != "") {
        bool valida = phoneRegex(user.phone);
        if (!valida) {
          mostrarSnackbar('Número telefónico invalido.', colorRed);
          Timer(Duration(milliseconds: 2000), () {
            setState(() {
              btnBool = true;
            });
          });
        } else {
          _registraUsuario(user);
        }
      } else {
        _registraUsuario(user);
      }
    }
    // else{
    //   mostrarSnackbar('Complete los datos.', colorRed, scaffoldKey);
    //   Timer(Duration(milliseconds: 2000), (){
    //     setState(() {
    //       btnBool = true;
    //     });
    //   });
    // }
  }

  _registraUsuario(user) async {
    bool resp = await userProvider.editUser(user);
    if (resp) {
      mostrarSnackbar('Se guardaron los datos.', colorMain);
      Timer(Duration(milliseconds: 2000), () {
        Get.until((route) => route.isFirst);
        // Navigator.of(context).popUntil((route) => route.isFirst);
      });
    } else {
      mostrarSnackbar('No se guardaron los datos ingresados.', colorRed);

      setState(() {
        btnBool = true;
      });
    }
  }
}
