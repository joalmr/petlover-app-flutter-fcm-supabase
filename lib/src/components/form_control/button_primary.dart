import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';

final _textstyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w700
);

Widget buttonPri(_text,_funtion){
  return RaisedButton(
    shape: shape20,
    color: colorMain,
    elevation: 2.0,
    textColor: Colors.white,
    child: Text(_text, style: _textstyle,),
    padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 15.0),
    onPressed: _funtion,
  );
}

Widget buttonOutLine(String _text,_funtion,Color _color){
  return OutlineButton(
    onPressed: _funtion,
    child: Text(_text, style: _textstyle,),
    padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 15.0),
    shape: shape20,
    borderSide: new BorderSide(color: _color, width: 0.5),
    highlightedBorderColor: _color,
    textColor: _color,
    // color: _color,
  );
}