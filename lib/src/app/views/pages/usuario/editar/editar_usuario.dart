import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/usuario_controller/usuario_controller.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Editar usuario', null),
      body: GetX<UsuarioController>(
        init: UsuarioController(),
        builder: (_) {
          return _.loading.value
              ? FadeViewSafeArea(
                  child: Container(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ))
              : FadeViewSafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 25.0),
                        FormularioText(
                          labelText: 'Nombre',
                          hintText: 'Ingrese nombre',
                          icon: Icons.person,
                          obscureText: false,
                          onChanged: (value) => _.nombre = value,
                          textCap: TextCapitalization.words,
                          valorInicial: _.nombre,
                          boardType: TextInputType.text,
                        ),
                        FormularioText(
                          labelText: 'Apellido',
                          hintText: 'Ingrese apellido',
                          icon: Icons.person_outline,
                          obscureText: false,
                          onChanged: (value) => _.apellido = value,
                          textCap: TextCapitalization.words,
                          valorInicial: _.apellido,
                          boardType: TextInputType.text,
                        ),
                        FormularioText(
                          labelText: 'Teléfono',
                          hintText: 'Ingrese teléfono',
                          icon: Icons.phone,
                          obscureText: false,
                          onChanged: (value) => _.telefono = value,
                          textCap: TextCapitalization.words,
                          valorInicial: _.telefono,
                          boardType: TextInputType.phone,
                        ),
                        Text(
                          'Ingresar su teléfono es útil para que la veterinaria pueda comunicarse con usted.',
                          style: TextStyle(fontSize: sizeSmallx1),
                        ),
                        SizedBox(height: 25.0),
                        Center(
                            child: buttonPri(
                          'Guardar cambios',
                          _.btnBool.value ? _.onEdit : null,
                        ))
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
