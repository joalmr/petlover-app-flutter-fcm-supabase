import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/controllers/auth/login_controller.dart';

import 'data/icons_login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0), child: AppBar(elevation: 0)),
          body: FadeView(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 20),
                Image(
                  image: AssetImage('images/icon/logo-proypet.png'),
                  height: 52,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 0, left: 30, right: 30),
                  child: Container(
                    height: 240,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Swiper(
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      autoplay: true,
                      autoplayDelay: 3000,
                      pagination: new SwiperPagination(
                          builder: new DotSwiperPaginationBuilder(
                        activeColor: colorMain,
                        color: colorGray3,
                      )),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(iconLogin[index]['image']),
                              height: 80,
                            ),
                            SizedBox(height: 20),
                            Text(
                              iconLogin[index]['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              iconLogin[index]['text'],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
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
                SizedBox(height: 5.0),
                buttonPri(
                  _.loading.value ? 'Cargando..' : 'Iniciar sesión',
                  _.loading.value ? null : _.getLogin,
                ),
                Platform.isIOS
                    ? SizedBox(height: 10)
                    : Column(
                        children: [
                          SizedBox(height: 5.0),
                          btnFace(
                            text: 'Ingresar con Facebook',
                            funtion: _.initFacebookLogin,
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                Center(
                  child: FlatButton(
                    onPressed: () => Get.toNamed("olvidopass"),
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
                    FlatButton(
                      onPressed: () => Get.toNamed("registro"),
                      child: Text(
                        "Registrarse",
                        style: Get.textTheme.subtitle2
                            .apply(color: colorMain)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
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
