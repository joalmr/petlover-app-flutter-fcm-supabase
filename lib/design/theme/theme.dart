import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

ThemeData temaClaro = ThemeData(
  fontFamily: 'Lato',
  brightness: Brightness.light,
  primarySwatch: colorMain,
  accentColor: colorMain,
  backgroundColor: colorWhite,
  iconTheme: IconThemeData(color: Colors.black38),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 26, //28,
        fontWeight: FontWeight.w300,
        color: Colors.black38,
      ),
    ),
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.black38),
    actionsIconTheme: IconThemeData(color: Colors.black38),
    elevation: 0,
    color: Colors.transparent,
  ),
  dialogTheme: DialogTheme(shape: shape10),
  cardTheme: CardTheme(
    shape: shape10,
    elevation: 2.05,
    shadowColor: Colors.black.withOpacity(0.3),
  ),
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
