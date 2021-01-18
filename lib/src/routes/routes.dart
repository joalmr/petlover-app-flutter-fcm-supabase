import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/src/app/views/auth/onboard.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/reserva/vet_reservar.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/vet_detalle/detalle_vet.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/vet_detalle/tabs_detalle/comentario_tab/todos_comentarios_view.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/vet_find/buscar_veterinaria.dart';
import 'package:proypet/src/app/views/pages/atencion/atencion_califica.dart';
import 'package:proypet/src/app/views/pages/bonus_pet/canjear_puntos.dart';
import 'package:proypet/src/app/views/pages/bonus_pet/sorteo_puntos.dart';
import 'package:proypet/src/app/views/pages/bonus_pet/ultimos_puntos.dart';
import 'package:proypet/src/app/views/pages/mascota/detalle/components/historial_page.dart';
import 'package:proypet/src/app/views/pages/update_page.dart';
import 'package:proypet/src/app/views/pages/usuario/queja_view.dart';
import 'package:proypet/src/app/views/pages/mascota/agregar/agregar_mascota.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/detalle_historia.dart';
import 'package:proypet/src/app/views/auth/login_page.dart';
import 'package:proypet/src/app/views/auth/singup_page.dart';
import 'package:proypet/src/app/views/auth/forgot_page.dart';
import 'package:proypet/src/app/views/pages/_nav_bar/navigation_bar.dart';
import 'package:proypet/src/app/views/pages/_nav_view/home/reserva/detalle_reserva.dart';
import 'package:proypet/src/app/views/pages/mascota/detalle/detalle_mascota.dart';
import 'package:proypet/src/app/views/pages/usuario/editar/editar_usuario.dart';
import 'package:proypet/src/app/views/pages/usuario/mi_cuenta.dart';
import 'package:proypet/src/app/views/pages/usuario/password/cambia_password.dart';
import 'package:proypet/src/app/views/pages/usuario/solicita_veterinaria/solicitar_veterinaria.dart';

GetStorage box = GetStorage();

List<GetPage> getRutas() {
  return [
    GetPage(name: 'update', page: () => UpdatePage()),
    GetPage(
      name: '/',
      page: () => box.hasData('token') && box.hasData('verify')
          ? NavigationBar(currentTabIndex: 0)
          : OnBoardPage(),
    ),
    //
    GetPage(name: 'onboard', page: () => OnBoardPage()),
    GetPage(name: 'login', page: () => LoginPage()),
    GetPage(name: 'registro', page: () => SingupPage()),
    GetPage(name: 'olvidopass', page: () => ForgotPage()),

    GetPage(name: 'micuenta', page: () => MiCuentaPage()),
    GetPage(name: 'editarusuario', page: () => UserPage()),
    GetPage(name: 'cambiarpass', page: () => ChangePasswordPage()),
    //
    GetPage(name: 'navInicio', page: () => NavigationBar(currentTabIndex: 0)),
    GetPage(name: 'navNotifica', page: () => NavigationBar(currentTabIndex: 1)),
    GetPage(name: 'navLista', page: () => NavigationBar(currentTabIndex: 2)),
    // GetPage(name: 'navDestacado', page: () => NavigationBar(currentTabIndex: 3)),
    GetPage(
        name: 'navRecompensa', page: () => NavigationBar(currentTabIndex: 3)),
    //
    GetPage(name: 'agregarmascota', page: () => MascotaAgregarPage()),
    GetPage(name: 'detallemascota', page: () => MascotaDetallePage()),
    GetPage(name: 'detallehistoriamascota', page: () => HistoriaPage()),
    GetPage(name: 'historialmascota', page: () => HistorialMascota()),
    //
    GetPage(name: 'vetdetalle', page: () => VetDetallePage()),
    GetPage(name: 'vetreserva', page: () => DataReserva()),
    //
    // GetPage(name: 'detalledestacado', page: () => DetalleDestacadoPage()),
    GetPage(name: 'detallereservado', page: () => DetalleReservado()),

    GetPage(name: 'calificaatencion', page: () => AtencionCalifica()),

    GetPage(name: 'solicitaveterinaria', page: () => SolicitaVetPage()),
    GetPage(name: 'vermascomentarios', page: () => TodosComentarios()),
    GetPage(name: 'buscarveterinaria', page: () => BuscarVeterinaria()),

    GetPage(name: 'enviarqueja', page: () => QuejaPage()),

    GetPage(name: 'puntosganados', page: () => PuntosGanados()),
    GetPage(name: 'canjearpuntos', page: () => CanjearPuntos()),
    GetPage(name: 'sorteopuntos', page: () => SorteoPuntos()),
  ];
}
