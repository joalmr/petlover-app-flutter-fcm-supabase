import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';


//final _shapeB = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
//final _shape = BorderRadius.circular(10.0);

Widget buttonPri(_text,_funtion){
  return RaisedButton(
    shape: shapeB,
    color: colorMain,
    elevation: 2.0,
    textColor: Colors.white,
    child: Text(_text, 
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
    onPressed: _funtion,
  );
}