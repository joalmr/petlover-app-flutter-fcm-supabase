import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/text_field.dart';

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
          // RaisedButton(
          //   shape: shapeBtn,
          //   color: colorSec,
          //   textColor: Colors.white,
          //   child: Text("Reservar", style: TextStyle(
          //     fontWeight: FontWeight.normal
          //   ),),
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 16.0,
          //     horizontal: 32.0,
          //   ),
          //   onPressed: (){},
          // )
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
    return DropdownButton(
      value: _opcionSeleccionada,
      items: getOpcionesDropdown(),
      onChanged: (opt){
        setState(() {
          _opcionSeleccionada=opt;
        });
      },
    );
  }
}