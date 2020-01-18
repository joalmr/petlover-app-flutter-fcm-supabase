import 'package:flutter/material.dart';
import 'package:proypet/src/pages/atenciones_page.dart';
import 'package:proypet/src/pages/auth/forgot_page.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
import 'package:proypet/src/pages/auth/singup_page.dart';
import 'package:proypet/src/pages/home_page.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/notificaciones_page.dart';
import 'package:proypet/src/pages/reserva_page.dart';
import 'package:proypet/src/pages/shared/menu_page.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';

Map<String,WidgetBuilder> getRoutes(){
  return <String,WidgetBuilder>{    
    'login'       : (BuildContext context)=>LoginPage(),
    'registro'    : (BuildContext context)=>SingupPage(),
    'olvidopass'  : (BuildContext context)=>ForgotPage(),
    'menu'        : (BuildContext context)=>MenuPage(),
    'nav'        : (BuildContext context)=>NavigationBar(),
    // 'home'           : (BuildContext context)=>HomePage(),//home
    // 'reserva'     : (BuildContext context)=>ReservaPage(),
    // 'mascotas'    :(BuildContext context)=>MascotasPage(),
    // 'atenciones'    :(BuildContext context)=>AtencionesPage(),
    // 'notificaciones'    :(BuildContext context)=>NotificacionesPage(),
  };
}