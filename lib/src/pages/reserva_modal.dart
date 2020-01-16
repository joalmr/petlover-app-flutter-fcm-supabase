//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control.dart';

//final _shape = BorderRadius.circular(100.0);

class ModalDataReserva extends StatefulWidget {
  @override
  _ModalData createState() => _ModalData();
}

class _ModalData extends State<ModalDataReserva> {
  List _mascota = [
    {'cod':'1','nombre':'Greco',},
    {'cod':'2','nombre':'Pirulin',},
    {'cod':'3','nombre':'Tito',},
  ];
  String _opcionSeleccionada='1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Mascota'),
          _crearDropDown(),
          SizedBox(height: 10.0,),
          Text('Fecha'),
          SizedBox(height: 50.0,),
          FormControl().buttonSec('Reservar', (){}),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();
    _mascota.forEach((_mascota){
      lista.add(DropdownMenuItem(
        child: Text(_mascota['nombre']),
        value: _mascota['cod'],
      ));
    });
    return lista;
  }

  Widget _crearDropDown(){
    return Material(
      child: DropdownButton(
        icon: Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        value: _opcionSeleccionada,
        items: getOpcionesDropdown(),
        onChanged: (opt){
          setState(() {
            _opcionSeleccionada=opt;
          });
        },
      ),
    );
  }
}