// import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  //token app
  get token => box.read('token') ?? '';
  set token(String value) => box.write('token', value);
  tokenDel() => box.remove('token');

  //verificado
  get verify => box.read('verify') ?? null;
  set verify(String value) => box.write('verify', value);

  get position => box.read('position') ?? null;
  set position(String value) => box.write('position', value);
  positionDel() => box.remove('position');

  //se usa para guardar la direccion de la ultima reserva realizada
  get myAddress => box.read('address') ?? '';
  set myAddress(String value) => box.write('address', value);

  //se usa para guardar la posicion de la ultima reserva realizada
  get myAddressLatLng => box.read('mylatlng') ?? '';
  set myAddressLatLng(String value) => box.write('mylatlng', value);

  //tema app
  get themeMode => box.read('theme');
  set themeMode(String value) => box.write('theme', value);
}
