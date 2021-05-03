import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/source/usuario/controller/password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Cambiar contraseña', null),
      body: FadeViewSafeArea(
        child: GetX<PasswordController>(
            init: PasswordController(),
            builder: (_) {
              return ListView(
                padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 20.0), //.symmetric(horizontal: 25.0,vertical: 10.0),
                children: <Widget>[
                  FormularioText(
                    labelText: 'Contraseña actual',
                    hintText: 'Ingrese contraseña actual',
                    icon: Icons.lock,
                    iconSuf: InkWell(
                      child: Icon(_.passwordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: _.togglePassword1,
                    ),
                    obscureText: !_.passwordVisible.value,
                    onChanged: (value) => _.password = value,
                    textCap: TextCapitalization.none,
                    valorInicial: null,
                    boardType: TextInputType.text,
                  ),
                  FormularioText(
                    labelText: 'Nueva contraseña',
                    hintText: 'Ingrese contraseña nueva',
                    icon: Icons.lock,
                    iconSuf: InkWell(
                      child: Icon(_.passwordVisible2.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: _.togglePassword2,
                    ),
                    obscureText: !_.passwordVisible2.value,
                    onChanged: (value) => _.passwordNueva = value,
                    textCap: TextCapitalization.none,
                    valorInicial: null,
                    boardType: TextInputType.text,
                  ),
                  SizedBox(height: 25.0),
                  Center(
                    child: btnPrimary(
                      text: 'Cambiar contraseña',
                      onPressed:
                          _.clickPassword.value ? _.changePassword : null,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
