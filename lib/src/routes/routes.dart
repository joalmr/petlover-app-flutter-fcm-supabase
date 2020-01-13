import 'package:flutter/material.dart';
import 'package:proypet/src/pages/home_page.dart';
import 'package:proypet/src/pages/login_page.dart';
import 'package:proypet/src/pages/reserva_page.dart';
import 'package:proypet/src/pages/shared/menu_page.dart';

Map<String,WidgetBuilder> getRoutes(){
  return <String,WidgetBuilder>{
    '/'     : (BuildContext context)=>HomePage(),
    'login'     : (BuildContext context)=>LoginPage(),
    'reserva'     : (BuildContext context)=>ReservaPage(),
    'menu'     : (BuildContext context)=>MenuPage(),
  };
}