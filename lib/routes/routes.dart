import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/source/_navbar/view/navigation_bar.dart';
import 'package:proypet/source/atencion/view/atencion_califica.dart';
import 'package:proypet/source/auth/view/forgot_page.dart';
import 'package:proypet/source/auth/view/login_page.dart';
import 'package:proypet/source/auth/view/onboard.dart';
import 'package:proypet/source/auth/view/singup_page.dart';
import 'package:proypet/source/home/view/reserva/detalle_reserva.dart';
import 'package:proypet/source/mascota/view/agregar/agregar_mascota.dart';
import 'package:proypet/source/mascota/view/detalle/components/historial_page.dart';
import 'package:proypet/source/mascota/view/detalle/detalle_mascota.dart';
import 'package:proypet/source/recompensas/view/bonus_pet/canjear_puntos.dart';
import 'package:proypet/source/recompensas/view/bonus_pet/sorteo_puntos.dart';
import 'package:proypet/source/recompensas/view/bonus_pet/ultimos_puntos.dart';
import 'package:proypet/source/shopping/view/shop_cart_page.dart';
import 'package:proypet/source/shopping/view/shopping_product_page.dart';
import 'package:proypet/source/usuario/view/ayuda.dart';
import 'package:proypet/source/usuario/view/editar/editar_usuario.dart';
import 'package:proypet/source/usuario/view/faq/faq.dart';
import 'package:proypet/source/usuario/view/feedback/feedback.dart';
import 'package:proypet/source/usuario/view/mi_cuenta.dart';
import 'package:proypet/source/usuario/view/password/cambia_password.dart';
import 'package:proypet/source/usuario/view/quejas/queja_view.dart';
import 'package:proypet/source/usuario/view/solicita_veterinaria/solicitar_veterinaria.dart';

import 'package:proypet/source/veterinarias/view/vet_detalle/detalle_vet.dart';
import 'package:proypet/source/veterinarias/view/vet_detalle/tabs_detalle/comentario_tab/todos_comentarios_view.dart';
import 'package:proypet/source/veterinarias/view/vet_find/buscar_veterinaria.dart';
import 'package:proypet/source/veterinarias/view/vet_reserva/vet_reservar.dart';

GetStorage box = GetStorage();

List<GetPage> getRutas() {
  return [
    GetPage(
      name: '/',
      page: () => box.hasData('token') && box.hasData('verify')
          ? NavigationBar(currentTabIndex: 0)
          : OnBoardPage(),
    ),
    //
    GetPage(name: 'onboard', page: () => OnBoardPage()),
    GetPage(name: 'login', page: () => LoginPage()),

    GetPage(name: 'navInicio', page: () => NavigationBar(currentTabIndex: 0)),
    GetPage(name: 'navNotifica', page: () => NavigationBar(currentTabIndex: 1)),
    GetPage(name: 'navLista', page: () => NavigationBar(currentTabIndex: 2)),
    GetPage(
        name: 'navRecompensa', page: () => NavigationBar(currentTabIndex: 3)),
    GetPage(name: 'navShopping', page: () => NavigationBar(currentTabIndex: 4)),

    GetPage(name: 'registro', page: () => SingupPage()),
    GetPage(name: 'olvidopass', page: () => ForgotPage()),
    GetPage(name: 'micuenta', page: () => MiCuentaPage()),
    GetPage(name: 'editarusuario', page: () => UserPage()),
    GetPage(name: 'cambiarpass', page: () => ChangePasswordPage()),

    GetPage(name: 'agregarmascota', page: () => MascotaAgregarPage()),
    GetPage(name: 'detallemascota', page: () => MascotaDetallePage()),
    // GetPage(name: 'detallehistoriamascota', page: () => HistoriaPage()),
    GetPage(name: 'historialmascota', page: () => HistorialMascota()),
    GetPage(name: 'vetdetalle', page: () => VetDetallePage()),
    GetPage(name: 'vetreserva', page: () => DataReserva()),
    GetPage(name: 'detallereservado', page: () => DetalleReservado()),
    GetPage(name: 'calificaatencion', page: () => AtencionCalifica()),
    GetPage(name: 'vermascomentarios', page: () => TodosComentarios()),
    GetPage(name: 'buscarveterinaria', page: () => BuscarVeterinaria()),
    GetPage(name: 'puntosganados', page: () => PuntosGanados()),
    GetPage(name: 'canjearpuntos', page: () => CanjearPuntos()),
    GetPage(name: 'sorteopuntos', page: () => SorteoPuntos()),

    GetPage(name: 'solicitaveterinaria', page: () => SolicitaVetPage()),
    GetPage(name: 'ayuda', page: () => AyudaPage()),
    GetPage(name: 'enviarqueja', page: () => QuejaPage()),
    GetPage(name: 'feedback', page: () => FeedbackPage()),
    GetPage(name: 'faq', page: () => FaqPage()),

    GetPage(name: 'shopproduct', page: () => ShoppingProductPage()),
    GetPage(name: 'shopcart', page: () => ShopCartPage()),
  ];
}
