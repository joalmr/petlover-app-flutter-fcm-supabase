import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';


Widget buttonPri(_text,_funtion){
  return RaisedButton(
    shape: shapeB,
    color: colorMain,
    elevation: 2.0,
    textColor: Colors.white,
    child: Text(_text, 
      style: TextStyle(
        fontSize: sizeH4,
        fontWeight: FontWeight.w700
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
    onPressed: _funtion,
  );
}
