// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

  Future<Position> fnPosition() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }