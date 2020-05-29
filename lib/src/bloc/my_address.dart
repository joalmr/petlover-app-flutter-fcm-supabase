import 'dart:async';

import 'package:proypet/src/model/maps/address.dart';

class MyAddressBloc {

  final _myaddressController = StreamController<String>.broadcast();

  //Recuperar dato
  Stream<String> get addressStream => _myaddressController.stream;

  //Insertar valor
  Function(String) get changeAddress => _myaddressController.sink.add;


  final _direccionesController = StreamController<List<Prediction2>>.broadcast();
  //Recuperar dato
  Stream<List<Prediction2>> get direccionesStream => _direccionesController.stream;

  //Insertar valor
  Function(List<Prediction2>) get changeDirecciones => _direccionesController.sink.add;

  //Cierre
  dispose(){
    _myaddressController?.close();
    _direccionesController?.close();
  }

}

