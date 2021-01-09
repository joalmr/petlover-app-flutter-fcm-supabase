import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/controllers/auth/services/facebook_sing.dart';
import 'package:proypet/src/controllers/auth/services/google_sign.dart';
import 'package:proypet/src/data/services/auth_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

import 'components/list_cuenta.dart';

class MiCuentaPage extends StatelessWidget {
  final _prefs = new PreferenciasUsuario();
  final loginApi = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Mi cuenta',
        acc: null,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          listAcc('editarusuario', 'Editar usuario', Icons.person),
          listAcc('cambiarpass', 'Cambiar contraseña', Icons.lock),
          InkWell(
            onTap: () => _cerrarSesion(context),
            child: Card(
              child: Container(
                height: 65,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: colorRed,
                        borderRadius: borderRadius,
                      ),
                      child: Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Cerrar sesión',
                        style:
                            Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _cerrarSesion(context) {
    Get.dialog(
      FadeIn(
        child: AlertDialog(
          title: null,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          content: Text("Desea cerrar sesión?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar',
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
            ),
            FlatButton(
              onPressed: () => _outToken(),
              child: Text('Cerrar sesión',
                  style: Get.textTheme.subtitle2
                      .apply(fontWeightDelta: 2, color: colorRed)),
            ),
          ],
        ),
      ),
    );
  }

  void _outToken() async {
    FacebookSignInService.signOut();
    GoogleSignInService.signOut();
    loginApi.logOut();
    _prefs.tokenDel(); //limpia token
    _prefs.verifyDel(); //limpia verificado
    _prefs.positionDel(); //limpia gps para lista vets
    _prefs.ubicacionDel(); //limpia direccion para lista vets
    _prefs.myAddressDel(); //limpia direccion de la ultima reserva realizada
    _prefs.myAddressLatLngDel(); //limpia gps de la ultima reserva realizada
    _prefs.notificaAvisoDel(); //limpia notificacion aviso

    Get.offAllNamed('login');
  }
}
