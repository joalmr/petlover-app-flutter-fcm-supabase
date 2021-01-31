import 'package:get_storage/get_storage.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  //token de usuario
  get token => box.read('token') ?? '';
  set token(String value) => box.write('token', value);
  tokenDel() => box.remove('token');
  hasToken() => box.hasData('token');

  //usuario verificado
  get verify => box.read('verify') ?? null;
  set verify(String value) => box.write('verify', value);
  verifyDel() => box.remove('verify');
  hasVerify() => box.hasData('verify');

  //se usa para los filtras de veterinarias
  get position => box.read('position') ?? null;
  set position(String value) => box.write('position', value);
  positionDel() => box.remove('position');
  hasPosition() => box.hasData('position');

  get ubicacion => box.read('ubicacion') ?? '';
  set ubicacion(String value) => box.write('ubicacion', value);
  ubicacionDel() => box.remove('ubicacion');
  hasUbicacion() => box.hasData('ubicacion');
  ////

  //se usa para guardar la direccion de la ultima reserva realizada TEXTO
  get myAddress => box.read('address') ?? '';
  set myAddress(String value) => box.write('address', value);
  myAddressDel() => box.remove('address');
  hasMyAddress() => box.hasData('address');

  //se usa para guardar la posicion de la ultima reserva realizada GPS
  get myAddressLatLng => box.read('mylatlng') ?? '';
  set myAddressLatLng(String value) => box.write('mylatlng', value);
  myAddressLatLngDel() => box.remove('mylatlng');
  hasMyAddressLatLng() => box.hasData('mylatlng');

  //aviso notificacion
  get notificaAviso => box.read('notifica') ?? false;
  set notificaAviso(bool value) => box.write('notifica', value);
  notificaAvisoDel() => box.remove('notifica');
  hasnotificaAviso() => box.hasData('notifica');

  //tema app
  get themeMode => box.read('theme');
  set themeMode(String value) => box.write('theme', value);
}
