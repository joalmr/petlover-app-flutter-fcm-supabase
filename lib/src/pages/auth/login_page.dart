import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/login/login_model.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';
import 'package:proypet/src/providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginSevenPageState createState() => _LoginSevenPageState();
}

class _LoginSevenPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  UserDato userModel = UserDato();
  final loginProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            WaveClipper(300.0,120.0),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Email', Icons.alternate_email, false, (value)=>userModel.email=value, TextCapitalization.none, null,
                TextInputType.text),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: textForm('Contraseña', Icons.lock, true, (value)=>userModel.password=value, TextCapitalization.none, null,
                TextInputType.text),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: buttonPri('Ingresar',_onToken),
            ),
            // FormControl().buttonPri('Ingresar', ()=>Navigator.pushReplacement(
            //   context,MaterialPageRoute(
            //     builder: (context) => NavigationBar(currentTabIndex: 1,)
            // ))),
            SizedBox(height: 20.0),
            Center(
              child: FlatButton(
                onPressed: ()=>Navigator.pushNamed(context,'olvidopass'),
                child: Text("Olvidó contraseña ?".toUpperCase(), 
                  style: TextStyle(
                    color:colorMain,
                    fontSize: 12 ,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No tienes una cuenta ?", 
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 12 ,
                  fontWeight: FontWeight.normal
                  )
                ),
                FlatButton(
                  onPressed: ()=>Navigator.pushNamed(context,'registro'),
                  child: Text("Regístrate ", 
                    style: TextStyle(
                      color:colorMain, 
                      fontWeight: FontWeight.w500,
                      fontSize: 12, 
                      decoration: TextDecoration.underline 
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onToken() async {
    formKey.currentState.save();
    setState(() { });

    Map resp = await loginProvider.loginToken(userModel);

    if(!resp['ok']){
      mostrarSnackbar(resp['mensaje'], colorRed, scaffoldKey);
    }
    else{
      if(resp['verify']!=null){
        Navigator.pushReplacementNamed(context, 'navInicio');
      }
      else{
        showDialog(
          context: context,
          builder: (BuildContext context){
            return FadeIn(
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                // title: Text('Error'),
                content: Container(
                  height: 100.0,
                  child: Center(child: Text('Verifique su correo.'))
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: ()=>Navigator.pop(context), 
                    child: Text('Continuar')
                  ),
                ],
              ),
            );
          }
        );
      }
      
    }    
  }
}
