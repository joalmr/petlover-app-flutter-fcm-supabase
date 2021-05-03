import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/btn_others.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/components/transition/fadeView.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/auth/domain/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0), child: AppBar(elevation: 0)),
          body: FadeView(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 100),
                Image(
                  image: AssetImage('images/icon/logo-proypet.png'),
                  height: 60,
                ),
                SizedBox(height: 20),
                FormularioText(
                  hintText: 'Email',
                  icon: Icons.alternate_email,
                  onChanged: (value) => _.email = value,
                  valorInicial: null,
                  activo: !_.loading.value,
                ),
                FormularioText(
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  obscureText: !_.passwordVisible.value,
                  iconSuf: InkWell(
                    child: Icon(_.passwordVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: _.togglePasswordVisibility,
                  ),
                  onChanged: (value) => _.password = value,
                  valorInicial: null,
                  activo: !_.loading.value,
                ),
                SizedBox(height: 10.0),
                btnPrimary(
                  text: _.loading.value ? 'Cargando..' : 'Iniciar sesión',
                  onPressed: _.loading.value ? null : _.getLogin,
                ),
                SizedBox(height: 10.0),
                Platform.isIOS
                    ? SizedBox(height: 0)
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8.0),
                                width: 20,
                                height: 1,
                                color: Get.theme.iconTheme.color,
                              ),
                              Text(
                                'O',
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                width: 20,
                                height: 1,
                                color: Get.theme.iconTheme.color,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          btnWIcon(
                            texto: 'Ingresar con Facebook',
                            icono: FontAwesomeIcons.facebook,
                            color: Color(0xFF3b5998),
                            funtion: _.loginFacebook,
                          ),
                          SizedBox(height: 5.0),
                          btnWIcon(
                            texto: 'Ingresar con Google',
                            pathImage: 'images/google.png',
                            color: Color(0xFFe1e1e1),
                            colorText: Colors.black38,
                            colorIcon: Colors.black38,
                            funtion: _.loginGoogle,
                          ),
                        ],
                      ),
                SizedBox(height: 10.0),
                Center(
                  child: TextButton(
                    onPressed: () => Get.toNamed("/olvidopass"),
                    child: Text(
                      "Olvidaste tu contraseña?".toUpperCase(),
                      style: TextStyle(
                          color: colorMain,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Nuevo en Proypet?", style: Get.textTheme.subtitle2),
                    TextButton(
                      child: Text(
                        "Registrarme",
                        style: Get.textTheme.subtitle2
                            .apply(color: colorMain)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      onPressed: () => Get.toNamed("/registro"),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
