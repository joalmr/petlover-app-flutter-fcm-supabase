import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/form_control/text_from.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src2/data/models/update/usuario/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../_global_controller.dart';

class VetDetalleController extends GetxController {
  EstablecimientoModel vet;
  RxBool reservaClic = true.obs;
  List<MascotaModel2> misMascotas = [];

  final homeC = Get.find<HomeController>();
  final globalC = Get.find<GlobalController>();

  UserModel2 usuario;
  // RxBool delivery = false.obs;

  @override
  void onInit() {
    super.onInit();
    vet = Get.arguments;
    traeMascotas();
    usuario = globalC.usuario;
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool get hasDelivery {
    bool delivery = false;
    vet.services.forEach((element) {
      if (element.slug == 'delivery') {
        delivery = true;
      }
    });
    return delivery;
  }

  traeMascotas() => misMascotas = homeC.mascotas.where((element) => element.status != 0).toList();

  llamar() => _launchPhone();

  _launchPhone() async {
    var url = 'tel:${vet.phone}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo llamar $url';
    }
  }

  bool get mascotasCount => misMascotas.length > 0;
  bool get hasTelefono => usuario.phone.trim().isNotEmpty;

  final formKey = GlobalKey<FormState>();

  reservar() => _reservar();

  _reservar() async {
    reservaClic.value = false;
    if (mascotasCount) {
      if (hasTelefono) {
        reservaClic.value = true;
        Get.toNamed('vetreserva');
      } else {
        Get.dialog(AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          content: Container(
              height: 200.0,
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text('Debe ingresar un número de teléfono', style: Get.textTheme.subtitle2),
                    SizedBox(height: 10.0),
                    FormularioText(
                      hintText: 'Ingrese teléfono',
                      icon: Icons.phone,
                      obscureText: false,
                      onSaved: (value) => usuario.phone = value,
                      textCap: TextCapitalization.words,
                      valorInicial: usuario.phone,
                      boardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10.0),
                    buttonPri("Guardar teléfono", null), //_onPhone
                    FlatButton(
                      child: Text("Cancelar", style: TextStyle(color: colorMain)),
                      onPressed: () {
                        reservaClic.value = true;
                        Get.back();
                      },
                    )
                  ],
                ),
              )),
        ));
      }
    } else {
      reservaClic.value = true;
      mostrarSnackbar('No puede generar una reserva, debe agregar una mascota', colorRed);
    }
  }
}

// void _onPhone() async {
//     setState(() {
//       reservarClic = true;
//       formKey.currentState.save();
//     });

//     bool phone = phoneRegex(user.phone);
//     if (phone) {
//       await userProvider.editUser(user); //
//       Get.back();
//     } else {
//       mostrarSnackbar('Número telefónico inválido', colorRed);
//     }
//   }
