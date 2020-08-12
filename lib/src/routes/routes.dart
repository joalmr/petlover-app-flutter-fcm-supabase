import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

List<GetPage> getRutas() {
  return [
    GetPage(name: 'login', page: () => LoginPage()),
    GetPage(name: 'registro', page: () => SingupPage()),
    GetPage(name: 'olvidopass', page: () => ForgotPage()),
    //
    GetPage(name: 'navInicio', page: () => NavigationBar(currentTabIndex: 0)),
    GetPage(name: 'navNotifica', page: () => NavigationBar(currentTabIndex: 1)),
    GetPage(name: 'navLista', page: () => NavigationBar(currentTabIndex: 2)),
    GetPage(name: 'navDestacado', page: () => NavigationBar(currentTabIndex: 3)),
    GetPage(name: 'navRecompensa', page: () => NavigationBar(currentTabIndex: 4)),
    //
    GetPage(name: 'agregarmascota', page: () => MascotaAgregarPage()),
    GetPage(name: 'detallemascota', page: () => MascotaDetallePage()),
    GetPage(name: 'detallehistoriamascota', page: () => HistoriaPage()),
    //
    GetPage(name: 'detalledestacado', page: () => DetalleDestacadoPage()),
    GetPage(name: 'detallereservado', page: () => DetalleReservado()),
  ];
}

// [
// GetPage(
// name: '/',
// page: () => MyHomePage(),
// ),
// GetPage(
// name: '/profile/',
// page: () => MyProfile(),
// ),
// //You can define a different page for routes with arguments, and another without arguments, but for that you must use the slash '/' on the route that will not receive arguments as above.
// GetPage(
// name: '/profile/:user',
// page: () => UserProfile(),
// ),
// GetPage(
// name: '/third',
// page: () => Third(),
// transition: Transition.cupertino
// ),
// ]
