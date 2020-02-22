import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
//final _shapeB = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
final _shape = BorderRadius.circular(10.0);

Widget textForm(_hinttext, _icon, _obscuretext, _onsaved){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Material(
      elevation: 0.0,
      borderRadius: _shape,
      color: Colors.grey[200],
      child: TextFormField(
        obscureText: _obscuretext,
        onSaved: _onsaved,
        //onChanged: (String value){},
        cursorColor: colorMain,
        decoration: InputDecoration(
          hintText: _hinttext,
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            //elevation: 0.0,
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              _icon,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ),
      ),
    ),
  );
}