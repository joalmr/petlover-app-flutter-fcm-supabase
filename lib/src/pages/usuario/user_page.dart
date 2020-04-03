import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/login/user_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/user_provider.dart';

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
      appBar: appbar(leadingH,'Editar usuario',null),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
        child: Form(
          key: formKey,
          child: FutureBuilder(
            future: userProvider.getUser(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else{
                user=snapshot.data.user;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 25.0,),
                    Text('Nombre'),
                    SizedBox(height: 10.0,),
                    textForm('Ingrese nombre', Icons.person_outline, false, (value)=>user.name=value, TextCapitalization.words, user.name,TextInputType.text),
                    SizedBox(height: 15.0,),
                    Text('Apellido'),
                    SizedBox(height: 10.0,),
                    textForm('Ingrese apellido', Icons.person, false, (value)=>user.lastname=value, TextCapitalization.words, user.lastname,TextInputType.text),
                    SizedBox(height: 15.0,),
                    Text('Teléfono'),
                    SizedBox(height: 10.0,),
                    textForm('Ingrese teléfono', Icons.phone, false, (value)=>user.phone=value, TextCapitalization.words, user.phone,TextInputType.phone),
                    SizedBox(height: 35.0,),
                    Center(
                      child: buttonPri('Guardar cambios', btnBool ? _onEdit : null ) //()=>agregarDialog()
                    )
                  ],
                );
              }
            },
          ),
        )
      ),
    );
  }

  void _onEdit() async {
    setState(() {
      formKey.currentState.save();
      btnBool = false;      
    });

    if(user.name.trim()!="" && user.phone.trim()!=""){    
      bool resp = await userProvider.editUser(user);
      if(resp){
        mostrarSnackbar('Se guardó los datos.', colorMain, scaffoldKey);
        Timer(Duration(milliseconds: 2000), ()=>Navigator.popUntil(context, ModalRoute.withName("nav")) ) ;
      }
      else{
        mostrarSnackbar('No se guardó los datos.', colorRed, scaffoldKey);
        btnBool = true;
      }
    }
    else{
      mostrarSnackbar('Complete los datos.', colorRed, scaffoldKey);    
      btnBool = true;  
    }
  }
}