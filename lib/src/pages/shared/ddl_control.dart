import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

//final _shape = BorderRadius.circular(10.0);

class DdlControl extends StatefulWidget {
  final lista;
  DdlControl({@required this.lista});
  @override
  _DdlControl createState() => _DdlControl(lista: lista);
}
class _DdlControl extends State<DdlControl> {
  final lista;
  _DdlControl({@required this.lista});
  String _opcionSeleccionada='1'; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 0.0,
        borderRadius: shape,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
              isExpanded: true,
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(lista),
              onChanged: (opt){
                setState(() {
                  _opcionSeleccionada=opt;
                });
              },
            ),
          ),
        ), 
      ),
    );
  }
}

class DdlControl2 extends StatefulWidget {
  final lista;
  DdlControl2({@required this.lista});
  @override
  _DdlControl2 createState() => _DdlControl2(lista: lista);
}
class _DdlControl2 extends State<DdlControl2> {
  final lista;
  _DdlControl2({@required this.lista});
  String _opcionSeleccionada='1'; 
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0.0,
        borderRadius: shape,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
              isExpanded: true,
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(lista),
              onChanged: (opt){
                setState(() {
                  _opcionSeleccionada=opt;
                });
              },
            ),
          ),
        ), 
      );
  }
}

List<DropdownMenuItem<String>> getOpcionesDropdown(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista['nombre']),
        value: _lista['cod'],
      ));
    });
    return lista;
  }