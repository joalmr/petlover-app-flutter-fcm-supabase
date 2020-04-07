import 'package:flutter/material.dart';
import 'package:proypet/src/pages/auth/forgot_page.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
import 'package:proypet/src/pages/auth/singup_page.dart';
import 'package:proypet/src/pages/mascota/detalle_historia.dart';
import 'package:proypet/src/pages/mascota/mascota_detalle_page.dart';
import 'package:proypet/src/pages/mascota/mascotas_agregar_page.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';

Map<String,WidgetBuilder> getRoutes(){
  return <String,WidgetBuilder>{    
    'login'             : (BuildContext context)=>LoginPage(),
    'registro'          : (BuildContext context)=>SingupPage(),
    'olvidopass'        : (BuildContext context)=>ForgotPage(),
    //nav abre
    'navInicio'         : (BuildContext context)=>NavigationBar(currentTabIndex: 0), //, marcar: 0,
    'navNotifica'       : (BuildContext context)=>NavigationBar(currentTabIndex: 1), //, marcar: 0,
    'navLista'          : (BuildContext context)=>NavigationBar(currentTabIndex: 2), //, marcar: 0,
    'navDestacado'      : (BuildContext context)=>NavigationBar(currentTabIndex: 3), //, marcar: 0,
    'navRecompensa'     : (BuildContext context)=>NavigationBar(currentTabIndex: 4), //, marcar: 0,
    //nav cierra
    'agregarmascota'    : (BuildContext context)=>MascotaAgregarPage(),
    'detallemascota'    : (BuildContext context)=>MascotaDetallePage(),
    'detallehistoriamascota'    : (BuildContext context)=>HistoriaPage(),

  };
}