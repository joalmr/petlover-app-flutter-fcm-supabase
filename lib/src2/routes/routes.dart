import 'package:get/get.dart';

import 'package:proypet/src/views/pages/mascota/detalle_historia.dart';
import 'package:proypet/src/views/pages/mascota/mascota_detalle_page.dart';
import 'package:proypet/src/views/pages/mascota/mascotas_agregar_page.dart';
import 'package:proypet/src/views/pages/_navigation_pages/navigation_bar.dart';
import 'package:proypet/src/views/pages/viewDestacados/destacadoDetalle/destacado_detalle.dart';
import 'package:proypet/src/views/pages/viewHome/booking/detalle_reservado.dart';

import 'package:proypet/src2/app/views/auth/login_page.dart';
import 'package:proypet/src2/app/views/auth/singup_page.dart';
import 'package:proypet/src2/app/views/auth/forgot_page.dart';

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
