import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/utils/utils.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';


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
        borderRadius: borderRadius,
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



  Widget ddlMain(opcionSeleccionada, lista, cambiaOpc){
    //print(lista);
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
            isExpanded: true,
            value: opcionSeleccionada,
            items: getOpcionesDropdown(lista),
            onChanged: cambiaOpc //(opt){ setState(() { opcionSeleccionada=opt; });},
          ),
        ),
      ), 
    );
  }

  Widget ddlMainImg(opcionSeleccionada, lista, cambiaOpc){
    //print(lista);
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
            isExpanded: true,
            value: opcionSeleccionada,
            items: getOpcionesImgFuture(lista),
            onChanged: cambiaOpc //(opt){ setState(() { opcionSeleccionada=opt; });},
          ),
        ),
      ), 
    );
  }

  Widget ddlMainOut(opcionSeleccionada, lista, cambiaOpc,String deshabilitado){
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            disabledHint: Text(deshabilitado),            
            icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
            isExpanded: true,
            value: opcionSeleccionada,
            items: getOpcionesDropdown(lista),
            onChanged: cambiaOpc //(opt){ setState(() { opcionSeleccionada=opt; });},
          ),
        ),
      ), 
    );
  }

  Widget ddlFuture(opcionSeleccionada, lista, cambiaOpc){
  try{
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
            isExpanded: true,
            value: opcionSeleccionada,
            items: getOpcionesFuture(lista),
            onChanged: cambiaOpc //(opt){ setState(() { opcionSeleccionada=opt; });},
          ),
        ),
      ), 
    );
  }
  catch(ex){
    return Center(child: CircularProgressIndicator());
  }
}

  Widget ddlSearchFuture(opcionSeleccionada, lista, cambiaOpc){
    try{
      return Material(
        elevation: 0.0,
        borderRadius: borderRadius,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: DropdownButtonHideUnderline(
            child: SearchableDropdown(
              items: getOpcionesSearch(lista),
              value: opcionSeleccionada,
              onChanged: cambiaOpc,
              hint: "Seleccione raza",
              searchHint: "Seleccione raza",
              isExpanded: true,
              closeButton: "Cerrar",
              icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
              displayClearIcon: false,
              underline: "",
            ),
          ),
        ), 
      );
    }
    catch(ex){
      return Center(child: CircularProgressIndicator());
    }
  }

