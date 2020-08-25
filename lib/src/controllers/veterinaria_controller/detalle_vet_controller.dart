import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src/data/models/update/usuario/user_model.dart';
import 'package:proypet/src/data/services/user_service.dart';
import 'package:proypet/src/utils/regex.dart';
import 'package:url_launcher/url_launcher.dart';

import '../_global_controller.dart';

class VetDetalleController extends GetxController {
  final userService = new UserService();

  EstablecimientoModel vet;
  RxBool reservaClic = true.obs;
  List<MascotaModel2> misMascotas = [];

  RxString _telefono = "".obs;

  set telefono(String value) => _telefono.value = value;
  String get telefono => _telefono.value;

  final homeC = Get.find<HomeController>();
  final globalC = Get.find<GlobalController>();

  UserModel2 usuario;

  @override
  void onInit() {
    super.onInit();
    vet = Get.arguments;
    traeMascotas();
    usuario = globalC.usuario;
    telefono = usuario.phone;
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
  bool get sinTelefono => telefono.isNullOrBlank;
  // bool get sinTelefono => globalC.usuario.phone.isEmpty;

  final formKey = GlobalKey<FormState>();

  reservar() => _reservar();

  _reservar() async {
    reservaClic.value = false;
    if (mascotasCount) {
      if (!sinTelefono) {
        reservaClic.value = true;
        Get.toNamed('vetreserva');
      } else {
        reservaClic.value = true;
        Get.dialog(AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          content: Container(
              height: 220.0,
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
                      onChanged: (value) => telefono = value,
                      textCap: TextCapitalization.words,
                      valorInicial: telefono,
                      boardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10.0),
                    buttonPri("Guardar teléfono", _onPhone),
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

  bool get telCambio => telefono.isNullOrBlank;

  void _onPhone() async {
    if (!telCambio) {
      bool phone = phoneRegex(telefono);
      if (phone) {
        await userService.editUser(usuario.name, usuario.lastname, telefono);
        globalC.getUsuario();
        usuario = globalC.usuario;
        Get.back();
      } else {
        mostrarSnackbar('Número telefónico inválido', colorRed);
      }
    } else {
      mostrarSnackbar('Número telefónico inválido', colorRed);
    }
  }
}
