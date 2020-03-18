import 'package:flutter/material.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:geolocator/geolocator.dart';
import 'package:number_display/number_display.dart';

calculateAge(DateTime birthDate) {
  if(birthDate == null) return "No definido";
  String resp; 
  int edad,mes,dia,diferencia;
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(birthDate);
  diferencia = difference.inDays;
  edad = diferencia ~/ 365;
  mes = (diferencia ~/ 30)%12;
  dia = ((diferencia % 365)%30);

  String rAnio=' años';
  String rMes=' meses';
  String rDia=' días';

  if(edad==1) rAnio=' año';
  if(mes==1) rMes=' mes';
  if(dia==1) rDia=' día';

  if(edad==0 && mes>0){
    resp = mes.toString() + rMes;
  }
  if(edad==0 && mes==0){
    resp =  dia.toString() + rDia;
  }
  if(edad>0 && mes==0){
    resp = edad.toString() + rAnio;
  }
  if(edad>0 && mes>0){
    resp = edad.toString() + rAnio +' '+ mes.toString() + rMes;
  }
  
  return resp;
}

//lista para ddl

  List<DropdownMenuItem<String>> getOpcionesDropdown(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista['name']),
        value: _lista['id'],
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesFuture(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista.name),
        value: _lista.id.toString()
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesSearch(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista.name),
        value: _lista.id+";"+_lista.name
      ));
    });
    return lista;
  }

double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p)/2 + 
        c(lat1 * p) * c(lat2 * p) * 
        (1 - c((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}

Future<String> fnDistance(lat1,lng1) async{
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  double distanciagps = await Geolocator().distanceBetween(lat1, lng1, position.latitude, position.longitude);
  final display = createDisplay(length: 4);
  return display(distanciagps);
}

Future<Position> fnPosition() async{
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return position;
}