import 'package:flutter/material.dart';
import 'package:proypet/src/bloc/my_address.dart';
export 'package:proypet/src/bloc/my_address.dart';

class Provider extends InheritedWidget{

  final myaddressBloc = MyAddressBloc();

  Provider({Key key, Widget child})
    : super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MyAddressBloc of ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().myaddressBloc;
  }
}