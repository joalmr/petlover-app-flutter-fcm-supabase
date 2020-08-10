import 'package:flutter/material.dart';
import 'package:proypet/src/views/auth/forgot_page.dart';
import 'package:proypet/src/views/auth/login_page.dart';
import 'package:proypet/src/views/auth/singup_page.dart';
import 'package:proypet/src/views/pages/mascota/detalle_historia.dart';
import 'package:proypet/src/views/pages/mascota/mascota_detalle_page.dart';
import 'package:proypet/src/views/pages/mascota/mascotas_agregar_page.dart';
import 'package:proypet/src/views/pages/_navigation_pages/navigation_bar.dart';
import 'package:proypet/src/views/pages/viewDestacados/destacadoDetalle/destacado_detalle.dart';
import 'package:proypet/src/views/pages/viewHome/booking/detalle_reservado.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'registro': (BuildContext context) => SingupPage(),
    'olvidopass': (BuildContext context) => ForgotPage(),
    //nav abre
    'navInicio': (BuildContext context) => NavigationBar(currentTabIndex: 0), //home
    'navNotifica': (BuildContext context) => NavigationBar(currentTabIndex: 1), //lista de notificaciones
    'navLista': (BuildContext context) => NavigationBar(currentTabIndex: 2), //lista de veterinarias
    'navDestacado': (BuildContext context) => NavigationBar(currentTabIndex: 3), //destacados
    'navRecompensa': (BuildContext context) => NavigationBar(currentTabIndex: 4), //puntos
    //nav cierra
    'agregarmascota': (BuildContext context) => MascotaAgregarPage(),
    'detallemascota': (BuildContext context) => MascotaDetallePage(),
    'detallehistoriamascota': (BuildContext context) => HistoriaPage(),
    'detalledestacado': (BuildContext context) => DetalleDestacadoPage(), //detalle destacado
    'detallereservado': (BuildContext context) => DetalleReservado(), //detalle de la reserva
  };
}
