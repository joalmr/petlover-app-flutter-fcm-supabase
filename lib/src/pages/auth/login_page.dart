import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/pages/shared/wave_clipper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginSevenPageState createState() => _LoginSevenPageState();
}

class _LoginSevenPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          WaveClipper(300.0,120.0),
          SizedBox(height: 30.0),
          FormControl().textfield('Email', Icons.mail, false),
          SizedBox(height: 20),
          FormControl().textfield('Contraseña', Icons.lock, true),
          SizedBox(height: 25.0),
          //pushReplacementNamed
          FormControl().buttonPri('Ingresar', ()=>Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (context) => NavigationBar()
          ))),
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
    );
  }

}
