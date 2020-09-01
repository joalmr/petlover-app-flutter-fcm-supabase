import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';

const MaterialColor newteal = MaterialColor(
  0xFF00A48C,
  <int, Color>{
    50: Color(0xFF00A48C),
    100: Color(0xFF00A48C),
    200: Color(0xFF00A48C),
    300: Color(0xFF00A48C),
    400: Color(0xFF00A48C),
    500: Color(0xFF00A48C), //base
    600: Color(0xFF00A48C),
    700: Color(0xFF00A48C),
    800: Color(0xFF00A48C),
    900: Color(0xFF00A48C),
  },
);

ThemeData temaClaro = ThemeData(
  fontFamily: 'Lato',
  brightness: Brightness.light,
  cursorColor: colorMain,
  primarySwatch: newteal,
  accentColor: colorMain,
  backgroundColor: colorGray1,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 18.0,
        color: Colors.black54,
      ),
    ),
    actionsIconTheme: IconThemeData(color: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black54),
    color: fondoScaffoldClaro,
    elevation: 1,
  ),
  dialogTheme: DialogTheme(shape: shape10),
  cardTheme: CardTheme(shape: shape10, elevation: .05),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorGray1,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    hintStyle: TextStyle(fontSize: 14.0),
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(style: BorderStyle.none, width: 0),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(style: BorderStyle.none, width: 0),
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.black54),
    headline2: TextStyle(color: Colors.black54),
    headline3: TextStyle(color: Colors.black54),
    headline4: TextStyle(color: Colors.black54),
    headline5: TextStyle(color: Colors.black54, fontSize: 26.0),
    headline6: TextStyle(color: Colors.black54, fontSize: 20.0),
    subtitle1: TextStyle(color: Colors.black54, fontSize: 16.0),
    subtitle2: TextStyle(color: Colors.black54, fontSize: 14.0),
    bodyText1: TextStyle(color: Colors.black54, fontSize: 16.0),
    bodyText2: TextStyle(color: Colors.black54, fontSize: 14.0),
  ),
);
