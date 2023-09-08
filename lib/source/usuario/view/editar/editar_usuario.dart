import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/usuario/controller/usuario_controller.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(texto: 'Editar usuario', acc: null),
      body: GetX<UsuarioController>(
        init: UsuarioController(),
        builder: (_) {
          return _.loading.value
              ? FadeViewSafeArea(
                  child: Container(
                  child: Center(
                    child: lottieLoading,
                  ),
                ))
              : FadeViewSafeArea(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                          'Ingresar su teléfono es necesario para que la veterinaria pueda comunicarse con usted.',
                          style: TextStyle(fontSize: font12),
                        ),
                        SizedBox(height: 25.0),
                        Center(
                          child: btnPrimary(
                            text: 'Guardar cambios',
                            onPressed: _.btnBool.value ? _.onEdit : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
