import 'package:flutter/material.dart';

  void mostrarSnackbar(String mensaje, Color color, GlobalKey<ScaffoldState> scaffoldKey){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 2000),
      backgroundColor: color,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);    
  }
