import 'dart:async';

import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/data/models/update/usuario/user_model.dart';
import 'package:proypet/src2/data/services/user_service.dart';
import 'package:proypet/src2/utils/regex.dart';

import '../_global_controller.dart';

class UsuarioController extends GetxController {
  final userService = new UserService();
  final homeC = Get.find<HomeController>();
  final globalC = Get.find<GlobalController>();

  RxBool loading = true.obs;
  RxBool btnBool = true.obs;

  RxString _nombre = ''.obs;
  RxString _apellido = ''.obs;
  RxString _telefono = ''.obs;

  set nombre(String value) => _nombre.value = value;
  String get nombre => _nombre.value;

  set apellido(String value) => _apellido.value = value;
  String get apellido => _apellido.value;

  set telefono(String value) => _telefono.value = value;
  String get telefono => _telefono.value;

  @override
  void onInit() {
    super.onInit();
    _cargaValores();
  }

  _cargaValores() {
    UserModel2 dato = globalC.usuario;

    nombre = dato.name;
    apellido = dato.lastname;
    telefono = dato.phone ?? '';

    loading.value = false;
  }

  bool get sinDatos => nombre.isNullOrBlank && apellido.isNullOrBlank;
  bool get conTelefono => telefono.isNullOrBlank;

  onEdit() => _onEdit();

  void _onEdit() {
    btnBool.value = false;

    if (sinDatos) {
      mostrarSnackbar('Complete los datos.', colorRed);
      Timer(Duration(milliseconds: 1500), () => btnBool.value = true);
    } else {
      if (!conTelefono) {
        bool valida = phoneRegex(telefono);
        if (!valida) {
          mostrarSnackbar('Número telefónico invalido.', colorRed);
          Timer(Duration(milliseconds: 1500), () => btnBool.value = true);
        } else {
          _registraUsuario();
        }
      } else {
        _registraUsuario();
      }
    }
  }

  _registraUsuario() async {
    bool resp = await userService.editUser(nombre, apellido, telefono);
    if (resp) {
      mostrarSnackbar('Se guardaron los datos.', colorMain);
      globalC.getUsuario();
      homeC.getSummary();
      Timer(Duration(milliseconds: 1500), () => btnBool.value = true);
      // Timer(Duration(milliseconds: 2000), () => Get.until((route) => route.isFirst));
    } else {
      mostrarSnackbar('No se guardaron los datos ingresados.', colorRed);
      btnBool.value = true;
    }
  }
}
