import 'package:flutter/material.dart';
import 'package:proypet/main.dart';

final _shapeB = RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0));
final _shape = BorderRadius.circular(100.0);

class FormControl {
  
  Widget textfield(_hinttext, _icon, _obscuretext){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: _shape,
        child: TextField(
          obscureText: _obscuretext,
          onChanged: (String value){},
          cursorColor: colorMain,
          decoration: InputDecoration(
              hintText: _hinttext,
              hintStyle: TextStyle(fontSize: 14.0),
              prefixIcon: Material(
                //elevation: 0.0,
                borderRadius: _shape,
                child: Icon(
                  _icon,
                  color: colorMain,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)),
        ),
      ),
    );
  }

  Widget buttonPri(_text,_funtion){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: RaisedButton(
          shape: _shapeB,
          color: colorMain,
          elevation: 2.0,
          textColor: Colors.white,
          child: Text(_text, 
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 12.0),
          onPressed: _funtion,
        ),
    );
  }

  Widget buttonSec(_text,_funtion){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: RaisedButton(
          shape: _shapeB,
          color: colorSec,
          elevation: 2.0,
          textColor: Colors.white,
          child: Text(_text, 
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 32.0),
          onPressed: _funtion,
        ),
    );
  }
}