import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/app/views/components/wave_clipper.dart';
import 'package:proypet/src/controllers/auth/login_controller.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar(backgroundColor: colorMain, elevation: 0)),
            body: FadeView(
              child: ListView(
                children: [
                  WaveClipper(300.0, 180.0),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => FormularioText(
                          hintText: 'Email',
                          icon: Icons.alternate_email,
                          onChanged: (value) => _.email = value,
                          valorInicial: null,
                          activo: !_.loading.value,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => FormularioText(
                          hintText: 'Contraseña',
                          icon: Icons.lock,
                          obscureText: !_.passwordVisible.value,
                          iconSuf: InkWell(
                            child: Icon(_.passwordVisible.value ? Icons.visibility_off : Icons.visibility),
                            onTap: _.togglePasswordVisibility,
                          ),
                          onChanged: (value) => _.password = value,
                          valorInicial: null,
                          activo: !_.loading.value,
                        )),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Obx(() => buttonPri(_.loading.value ? 'Cargando..' : 'Iniciar sesión', _.loading.value ? null : _.getLogin)),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: FlatButton(
                        onPressed: () => Get.toNamed("olvidopass"),
                        child: Text("Olvidaste tu contraseña?".toUpperCase(), style: TextStyle(color: colorMain, fontSize: 12, fontWeight: FontWeight.w700))),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Nuevo en Proypet?", style: Get.textTheme.subtitle2),
                      FlatButton(
                          onPressed: () => Get.toNamed("registro"),
                          child: Text("Registrarse", style: Get.textTheme.subtitle2.apply(color: colorMain).copyWith(decoration: TextDecoration.underline))),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
