import 'package:flutter/material.dart';
import 'package:proypet/src/pages/auth/forgot_page.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
import 'package:proypet/src/pages/auth/singup_page.dart';
import 'package:proypet/src/pages/mascota/mascotas_page.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';

Map<String,WidgetBuilder> getRoutes(){
  return <String,WidgetBuilder>{    
    'login'         : (BuildContext context)=>LoginPage(),
    'registro'      : (BuildContext context)=>SingupPage(),
    'olvidopass'    : (BuildContext context)=>ForgotPage(),
    //
    'nav'           : (BuildContext context)=>NavigationBar(currentTabIndex: 1),
    //
    //'mapa'        : (BuildContext context)=>ReservaMapaPage(establecimientos: ,),
    'mismascotas'   : (BuildContext context)=>MascotasPage(),
    //'editarmascota' : (BuildContext context)=>MascotasEditarPage()
  };
}