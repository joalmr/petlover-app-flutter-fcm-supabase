import 'dart:math' as Math;
import 'package:google_maps_flutter/google_maps_flutter.dart';

void getDistance() {
  var pOrigen = LatLng(-12.020600657886307, -77.11185701796576);
  var pPersona = [
    LatLng(-12.020600657886307, -77.0824769241177),
    LatLng(-12.086058, -76.9763811807292),
    LatLng(-12.0475986, -77.0325514),
    LatLng(-12.1220331192017, -77.0266494750977),
  ];

  var pNuevaPersona = [];

  pPersona.forEach((element) {
    var distancia = getDistanceKm(pOrigen.latitude, pOrigen.longitude,
        element.latitude, element.longitude);
    if (distancia < 10) {
      pNuevaPersona.add(element);
    }
  });
}

getDistanceKm(lat1, lon1, lat2, lon2) {
  var rDato = 6371; // Radius of the earth in km o en metros: 6378137
  var dLat = deg2rad(lat2 - lat1); // deg2rad
  var dLon = deg2rad(lon2 - lon1);
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(deg2rad(lat1)) *
          Math.cos(deg2rad(lat2)) *
          Math.sin(dLon / 2) *
          Math.sin(dLon / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = rDato * c; // Distance in km
  // print(d);
  return d;
}

deg2rad(deg) {
  return deg * (Math.pi / 180);
}
