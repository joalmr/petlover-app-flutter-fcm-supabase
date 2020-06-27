// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

final _prefs = new PreferenciasUsuario();

Future<Position> fnPosition() async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return position;
}

fnGetPosition() async {
  final datoPosicion = await fnPosition();
  _prefs.position = '${datoPosicion.latitude},${datoPosicion.longitude}';
  // print(_prefs.position);
}
