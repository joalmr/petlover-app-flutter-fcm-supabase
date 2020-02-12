import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
//final _shapeB = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

Widget textfieldBtn(_hinttext, _icon, _funtion){
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
    padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextField(
      cursorColor: colorMain,
      decoration: InputDecoration(
        hintText: _hinttext,
        border: InputBorder.none,
        suffixIcon: Container(
          child: IconButton(onPressed: _funtion, icon: _icon,color: colorMain,tooltip: 'Buscar'))
      ),
    ),
  );
}