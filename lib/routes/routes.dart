import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/source/_navbar/presentation/view/navigation_bar.dart';
import 'package:proypet/source/atencion/view/atencion_califica.dart';
import 'package:proypet/source/auth/presentation/view/forgot_page.dart';
import 'package:proypet/source/auth/presentation/view/login_page.dart';
import 'package:proypet/source/auth/presentation/view/onboard.dart';
import 'package:proypet/source/auth/presentation/view/singup_page.dart';
import 'package:proypet/source/home/presentation/view/reserva/detalle_reserva.dart';
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
import 'package:proypet/source/usuario/view/quejas/queja_view.dart';
import 'package:proypet/source/usuario/view/solicita_veterinaria/solicitar_veterinaria.dart';
import 'package:proypet/source/veterinarias/presentation/view/vet_detalle/detalle_vet.dart';
import 'package:proypet/source/veterinarias/presentation/view/vet_detalle/tabs_detalle/comentario_tab/todos_comentarios_view.dart';
import 'package:proypet/source/veterinarias/presentation/view/vet_find/buscar_veterinaria.dart';
import 'package:proypet/source/veterinarias/presentation/view/vet_reserva/vet_reservar.dart';

class AppRoutes{
  GetStorage box = GetStorage();

  // static final String login = '/login';
  
  List<GetPage> getRutas() {
    return [
      GetPage(
        name: '/',
        page: () => box.hasData('token') && box.hasData('verify')
            ? NavigationBar(currentTabIndex: 0)
            : OnBoardPage(),
        children: [
          GetPage(name: 'registro', page: () => SingupPage()),
          GetPage(name: 'olvidopass', page: () => ForgotPage()),
          GetPage(name: 'onboard', page: () => OnBoardPage()),
          GetPage(name: 'login', page: () => LoginPage()),
        ],
      ),
      //
      GetPage(
        name: 'nav', 
        page: () => NavigationBar(currentTabIndex: 0),//?nav/inicio
        
        children: [
          //? inicio
          GetPage(name: '/notifica', page: ()=> NavigationBar(currentTabIndex: 1)),
          GetPage(name: '/lista', page: () => NavigationBar(currentTabIndex: 2)),
          GetPage(name: '/recompensa', page: () => NavigationBar(currentTabIndex: 3)),
        ],
      ),
      GetPage(
        name: 'micuenta', 
        page: () => MiCuentaPage(),
        children: [
          GetPage(name: '/editar', page: () => UserPage()),
        ],
      ),
      GetPage(
        name: 'mascota', 
        page: () => MascotaDetallePage(),//?mascota/detalle
        children: [
          // GetPage(name: 'detalle', page: () => MascotaDetallePage()),
          GetPage(name: '/historial', page: () => HistorialMascota()),
          GetPage(name: '/agregar', page: () => MascotaAgregarPage()),
        ],
      ),
      GetPage(
        name: 'vet', 
        page: () => VetDetallePage(),//?vet/detalle
        children: [
          // GetPage(name: 'detalle', page: () => VetDetallePage()),
          GetPage(name: '/reserva', page: () => DataReserva()),
          GetPage(name: '/buscar', page: () => BuscarVeterinaria()), //?buscarveterinaria
        ],
      ),
      GetPage(
        name: 'help', 
        page: () => AyudaPage(),
        children: [
          GetPage(name: '/solicitavet', page: () => SolicitaVetPage()),
          GetPage(name: '/enviarqueja', page: () => QuejaPage()),
          GetPage(name: '/feedback', page: () => FeedbackPage()),
          GetPage(name: '/faq', page: () => FaqPage()),
          // GetPage(name: 'ayuda', page: () => AyudaPage()),
        ],
      ),
      //?antiguos
      GetPage(name: 'detallereservado', page: () => DetalleReservado()),
      GetPage(name: 'calificaatencion', page: () => AtencionCalifica()),
      GetPage(name: 'vermascomentarios', page: () => TodosComentarios()),
      GetPage(name: 'puntosganados', page: () => PuntosGanados()),
      GetPage(name: 'canjearpuntos', page: () => CanjearPuntos()),
      GetPage(name: 'sorteopuntos', page: () => SorteoPuntos()),
      //
      // GetPage(name: 'shopproduct', page: () => ShoppingProductPage()),
      // GetPage(name: 'shopcart', page: () => ShopCartPage()),
      //
      //*inactivas
      GetPage(
        name: 'shop', 
        page: () => MiCuentaPage(), //?cambiar
        children: [
          GetPage(name: '/product', page: () => ShoppingProductPage()),
          GetPage(name: '/cart', page: () => ShopCartPage()),
        ],
      ),
    ];
  }
}
