import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_short_model.dart';
import 'package:proypet/src/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src/data/models/update/usuario/user_model.dart';
import 'package:proypet/src/data/services/booking_service.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';
import 'package:proypet/src/data/services/user_service.dart';
import 'package:proypet/src/utils/regex.dart';
import 'package:url_launcher/url_launcher.dart';

import '../_global_controller.dart';
import 'lista_vets_controller.dart';

class VetDetalleController extends GetxController {
  final userService = new UserService();
  final vetService = new EstablecimientoService();
  final bookingService = new BookingService();

  Rx<EstablecimientoModel> _vet = EstablecimientoModel().obs;
  set vet(EstablecimientoModel value) => _vet.value = value;
  EstablecimientoModel get vet => _vet.value;

  RxBool reservaClic = true.obs;
  List<MascotaModel2> misMascotas = [];

  RxString _telefono = "".obs;

  RxBool cargando = true.obs;

  set telefono(String value) => _telefono.value = value;
  String get telefono => _telefono.value;

  String vetId;
  String vetInit;

  final homeC = Get.find<HomeController>();
  final globalC = Get.find<GlobalController>();
  final vetsC = Get.find<VeterinariasController>();

  UserModel2 usuario;

  @override
  void onInit() {
    super.onInit();
    vetInit = Get.arguments;
    traeMascotas();
    usuario = globalC.usuario;
    telefono = usuario.phone;
    getVet();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getVet() => _getVet(vetInit);
  _getVet(idInit) async {
    vetId = idInit;
    var respVet = await vetService.getVet(vetId);
    vet = respVet['establishment'];
    cargando.value = false;
  }

  bool get hasDelivery {
    //usado en reserva controller
    int existe = 0;
    vet.services.forEach((element) {
      if (element.slug == 'delivery') {
        existe++;
      }
    });
    if (existe != 0) {
      return true;
    }
    return false;
  }

  traeMascotas() => misMascotas =
      homeC.mascotas.where((element) => element.status != 0).toList();

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

  final formKey = GlobalKey<FormState>();

  reservar() => _reservar();

  List<EstablecimientoShortModel> vetPremium = [];
  _getPremiumClose() {
    vetPremium = vetsC.vetLocales.value
        .where((element) => element.premium == true && element.id != vet.id)
        .take(2)
        .toList();
  }

  _reservar() async {
    reservaClic.value = false;
    if (!vet.premium && !vet.available) {
      _getPremiumClose();
      reservaClic.value = true;
      bookingService.tryBooking(vet.id);

      Get.dialog(SimpleDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          Text(
              'Hola, disculpa este establecimiento no puede recibir reservas.'),
          SizedBox(height: 3),
          Text('Tenemos estas opciones cerca '),
          SizedBox(height: 10),
          vetPremium.length < 1
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sin resultados')))
              : vetPremium.length == 1
                  ? _gotoVet(vetPremium[0])
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _gotoVet(vetPremium[0]),
                        SizedBox(height: 10),
                        _gotoVet(vetPremium[1]),
                      ],
                    ),
          SizedBox(height: 10),
        ],
      ));
    } else {
      if (mascotasCount) {
        if (!sinTelefono) {
          reservaClic.value = true;
          Get.toNamed('vetreserva');
        } else {
          reservaClic.value = true;
          Get.dialog(AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            content: Container(
                height: 220.0,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text('Debe ingresar un número de teléfono',
                          style: Get.textTheme.subtitle2),
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
                        child: Text("Cancelar",
                            style: TextStyle(color: colorMain)),
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
        mostrarSnackbar(
            'No puede generar una reserva, debe agregar una mascota', colorRed);
      }
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

  Widget _gotoVet(EstablecimientoShortModel vetPremium) {
    return InkWell(
      onTap: () {
        cargando.value = true;
        Get.back();
        vet = _getVet(vetPremium.id);
        Timer(Duration(milliseconds: 250), () => cargando.value = false);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (vetPremium.slides.length > 0)
              ? Image(
                  image: CachedNetworkImageProvider(vetPremium.slides.first),
                  height: 75,
                )
              : Image(image: AssetImage("images/vet_prueba.jpg"), height: 75),
          SizedBox(height: 3),
          Text(vetPremium.name)
        ],
      ),
    );
  }
}
