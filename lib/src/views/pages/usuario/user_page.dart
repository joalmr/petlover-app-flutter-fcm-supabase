import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proypet/src/models/login/user_model.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/pagina_app.dart';
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
              return FadeView(
                child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          Text('Nombre'),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormularioText(
                            hintText: 'Ingrese nombre',
                            icon: Icons.person,
                            obscureText: false,
                            onSaved: (value) => user.name = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.name,
                            boardType: TextInputType.text,
                          ),
                          // textForm('Ingrese nombre', Icons.person, false, (value)=>user.name=value, TextCapitalization.words, user.name,TextInputType.text),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Apellido'),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormularioText(
                            hintText: 'Ingrese apellido',
                            icon: Icons.person,
                            obscureText: false,
                            onSaved: (value) => user.lastname = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.lastname,
                            boardType: TextInputType.text,
                          ),
                          // textForm('Ingrese apellido', Icons.person, false, (value)=>user.lastname=value, TextCapitalization.words, user.lastname,TextInputType.text),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Teléfono'),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormularioText(
                            hintText: 'Ingrese teléfono',
                            icon: Icons.phone,
                            obscureText: false,
                            onSaved: (value) => user.phone = value,
                            textCap: TextCapitalization.words,
                            valorInicial: user.phone,
                            boardType: TextInputType.phone,
                          ),
                          // textForm('Ingrese teléfono', Icons.phone, false, (value)=>user.phone=value, TextCapitalization.words, user.phone,TextInputType.phone),
                          Text(
                            'Ingresar su teléfono es útil para que la veterinaria pueda comunicarse con usted.',
                            style: TextStyle(fontSize: sizeLite),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          Center(
                              child: buttonPri(
                                  'Guardar cambios',
                                  btnBool
                                      ? _onEdit
                                      : null) //()=>agregarDialog()
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
      mostrarSnackbar('Complete los datos.', colorRed, scaffoldKey);
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          btnBool = true;
        });
      });
    } else {
      if (user.phone != "") {
        bool valida = phoneRegex(user.phone);
        if (!valida) {
          mostrarSnackbar('Número telefónico invalido.', colorRed, scaffoldKey);
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
      mostrarSnackbar('Se guardaron los datos.', colorMain, scaffoldKey);
      Timer(Duration(milliseconds: 2000), () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    } else {
      mostrarSnackbar(
          'No se guardaron los datos ingresados.', colorRed, scaffoldKey);

      setState(() {
        btnBool = true;
      });
    }
  }
}
