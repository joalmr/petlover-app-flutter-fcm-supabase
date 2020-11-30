import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/views/pages/atencion/atencion_view.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
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
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [BoxShadow(color: Colors.black45)]),
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
                  leading: Icon(Icons.share),
                  title: Text('Compartir con mis amigos'),
                  onTap: () => Share.share(
                      '¿Conoces Proypet? Descubre la nueva App para reservar citas en veterinarias y acceder a beneficios. Entérate más en: https://www.proypet.com',
                      subject: 'Registrate hoy a Proypet'),
                ),
                ListTile(
                  leading: Icon(IconProypet.consulta),
                  title: Text('Solicitar veterinaria'),
                  onTap: () => Get.toNamed('solicitaveterinaria'),
                ),
                ListTile(
                  leading: Icon(Icons.error_outline),
                  title: Text('Reportar problema'),
                  onTap: () => Get.toNamed('enviarqueja'),
                ),
                ListTile(
                  leading: Icon(
                    Get.isDarkMode ? Icons.brightness_2 : Icons.brightness_5,
                    // Get.isDarkMode
                    //     ? FontAwesomeIcons.solidMoon
                    //     : FontAwesomeIcons.solidSun,
                  ),
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
                  leading: Icon(Icons.person),
                  title: Text('Mi cuenta'),
                  onTap: () => Get.toNamed('micuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
