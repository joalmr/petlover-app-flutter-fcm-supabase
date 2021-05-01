import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

ThemeData temaOscuro = ThemeData(
  fontFamily: 'Lato',
  brightness: Brightness.dark,
  primarySwatch: colorMain,
  accentColor: colorMain,
  backgroundColor: colorDark3,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorMain,
    foregroundColor: Colors.white,
  ),
  iconTheme: IconThemeData(color: Colors.white38),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 26.0, //28
        fontWeight: FontWeight.w300,
        color: Colors.white38,
      ),
    ),
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white38),
    actionsIconTheme: IconThemeData(color: Colors.white38),
    elevation: 0,
    color: Colors.transparent,
  ),
  dialogBackgroundColor: Colors.grey[850],
  dialogTheme: DialogTheme(shape: shape10),
  cardTheme: CardTheme(
    color: colorDark3,
    shape: shape10,
    elevation: 2.05,
    shadowColor: Colors.black.withOpacity(0.3),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorDark1,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(style: BorderStyle.none, width: 0),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(style: BorderStyle.none, width: 0),
    ),
  ),
  dividerColor: colorDark3,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white, fontSize: 26.0),
    headline6: TextStyle(color: Colors.white, fontSize: 20.0),
    subtitle1: TextStyle(color: Colors.white, fontSize: 16.0),
    subtitle2: TextStyle(color: Colors.white, fontSize: 14.0),
    bodyText1: TextStyle(color: Colors.white, fontSize: 16.0),
    bodyText2: TextStyle(color: Colors.white, fontSize: 14.0),
  ),
);
