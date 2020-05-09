import 'package:flutter/material.dart';

Widget errorInternet(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 10.0),
      Text("La conexión a internet es débil"),
      Center(
        child: Image(
          height: 300,      
          width: 300, 
          image: AssetImage("images/gato-error.png")
        ),
      ),
    ],
  );
}

Widget errorMessage(String mensaje){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 10.0),
      Text(mensaje),
      Center(
        child: Image(
          height: 300,      
          width: 300, 
          image: AssetImage("images/gato-error.png")
        ),
      ),
    ],
  );
}