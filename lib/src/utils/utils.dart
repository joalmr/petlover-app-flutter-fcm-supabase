// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' show cos, sqrt, asin;
// import 'package:geolocator/geolocator.dart';


  // String calculateDistance(lat1, lon1, lat2, lon2){
  //   //lat2 y lon2 mi posicion
  //   var p = 0.017453292519943295;
  //   // var c = cos;
  //   var a = 0.5 - cos((lat2 - lat1) * p)/2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p))/2;
  //   var resp = 12742 * asin(sqrt(a));
  //   return '${resp.toStringAsFixed(2)}km';
  // }

  // Future<String> fnDistance(lat1,lng1) async{
  //   String distanciaKm;
  //   Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   double distanciagps = await Geolocator().distanceBetween(lat1, lng1, position.latitude, position.longitude);
  //   distanciagps=distanciagps/1000;
  //   // final display = createDisplay(length: 4);
  //   // return display(distanciagps);
  //   if(distanciagps>100){
  //     distanciaKm=distanciagps.toStringAsFixed(0);
  //   }
  //   else{
  //     distanciaKm=distanciagps.toStringAsFixed(3);
  //     distanciaKm=(distanciaKm.split('.')[1]=='000') ? distanciaKm.split('.')[0] : distanciaKm;
  //   }
  //   return '${distanciaKm}km';
  // }

