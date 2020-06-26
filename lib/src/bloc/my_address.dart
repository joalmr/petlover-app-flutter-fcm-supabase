// import 'dart:async';

// import 'package:proypet/src/model/maps/address.dart';

// class MyAddressBloc {

//   final _myaddressController = StreamController<String>.broadcast();
//   Stream<String> get addressStream => _myaddressController.stream;//Recuperar dato
//   Function(String) get changeAddress => _myaddressController.sink.add;//Insertar valor


//   final _direccionesController = StreamController<List<Prediction2>>.broadcast();
//   Stream<List<Prediction2>> get direccionesStream => _direccionesController.stream;//Recuperar dato
//   Function(List<Prediction2>) get changeDirecciones => _direccionesController.sink.add;//Insertar valor

//   //Cierre
//   dispose(){
//     _myaddressController?.close();
//     _direccionesController?.close();
//   }

// }

