import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/pages/atencion/atencion_view.dart';
import 'package:proypet/src/app/views/pages/usuario/editar/editar_usuario.dart';
import 'package:proypet/src/app/views/pages/usuario/password/cambia_password.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/services/auth_service.dart';
import 'package:share/share.dart';

class ConfigDrawer extends StatelessWidget {
  final _prefs = new PreferenciasUsuario();
  final loginApi = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  'Configuración',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                    letterSpacing: 3.0,
                    color: Get.textTheme.subtitle2.color,
                  ),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Calificar atenciones'),
                  onTap: () => Get.to(AtencionesPage()),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Editar usuario'),
                  onTap: () => Get.to(UserPage()),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Cambiar contraseña'),
                  onTap: () => Get.to(ChangePasswordPage()),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Compartir con mis amigos'),
                  onTap: () => Share.share(
                      '¿Conoces Proypet? Descubre la nueva App para reservar citas en veterinarias y acceder a beneficios. Entérate más en: https://www.proypet.com',
                      subject: 'Registrate hoy a Proypet'),
                ),
                ListTile(
                  leading: Icon(Get.isDarkMode ? Icons.brightness_2 : Icons.brightness_5),
                  title: Text(Get.isDarkMode ? 'Tema oscuro' : 'Tema claro'),
                  onTap: () {
                    if (Get.isDarkMode) {
                      Get.changeThemeMode(ThemeMode.light);
                      _prefs.themeMode = 'claro';
                    } else {
                      Get.changeThemeMode(ThemeMode.dark);
                      _prefs.themeMode = 'oscuro';
                    }
                  },
                ),
                ListTile(
                    leading: Icon(Icons.person_outline, color: colorRed),
                    title: Text('Cerrar sesión', style: TextStyle(color: colorRed)),
                    onTap: () => _cerrarSesion(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cerrarSesion(context) {
    Get.dialog(
      FadeIn(
        child: AlertDialog(
          title: null, //Text('Cerrar sesión'),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          content: Text("Desea cerrar sesión?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
            ),
            FlatButton(
              onPressed: () => _outToken(),
              child: Text('Cerrar sesión', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorRed)),
            ),
          ],
        ),
      ),
    );
  }

  void _outToken() async {
    loginApi.logOut();
    _prefs.tokenDel();
    _prefs.positionDel();
    _prefs.ubicacionDel();
    _prefs.myAddressDel();
    _prefs.myAddressLatLngDel();
    // print('==position==');
    // print(_prefs.position);
    // print('==ubica==');
    // print(_prefs.ubicacion);
    Get.offAllNamed('login');
  }
}
