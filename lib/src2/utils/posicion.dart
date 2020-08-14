import 'package:geolocator/geolocator.dart';

import 'preferencias_usuario/preferencias_usuario.dart';

final _prefs = new PreferenciasUsuario();

Future<Position> fnPosition() async {
  Position position = await Geolocator().getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  return position;
}

Future<void> fnGetPosition() async {
  print('=== entra position ===');
  final datoPosicion = await fnPosition();
  print(datoPosicion);
  _prefs.position = '${datoPosicion.latitude},${datoPosicion.longitude}';
  print('=== guarda gps ===');
}
