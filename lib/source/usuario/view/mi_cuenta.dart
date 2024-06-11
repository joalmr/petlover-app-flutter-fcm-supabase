import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/config/variables_globales.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';
// import 'package:proypet/source/auth/data/service/facebook_sing.dart';
// import 'package:proypet/source/auth/data/service/google_sign.dart';

import 'components/list_cuenta.dart';

class MiCuentaPage extends StatelessWidget {
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
          listAcc('micuenta/editar', 'Editar usuario', Icons.person),
          // listAcc('cambiarpass', 'Cambiar contraseña', Icons.lock),
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
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar',
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
            ),
            TextButton(
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
    // FacebookSignInService.signOut();
    // GoogleSignInService.signOut();
    loginApi.logOut();
    prefUser.tokenDel(); //limpia token
    prefUser.verifyDel(); //limpia verificado
    prefUser.positionDel(); //limpia gps para lista vets
    prefUser.ubicacionDel(); //limpia direccion para lista vets
    prefUser.myAddressDel(); //limpia direccion de la ultima reserva realizada
    prefUser.myAddressLatLngDel(); //limpia gps de la ultima reserva realizada
    prefUser.storageUserDel(); //quita veterinarias favoritas
    // prefUser.notificaAvisoDel(); //limpia notificacion aviso

    Get.offAllNamed('/login');
  }
}
