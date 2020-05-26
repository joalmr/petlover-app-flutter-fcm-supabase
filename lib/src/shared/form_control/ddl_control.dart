import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/ddl_opciones.dart';
// import 'package:proypet/src/utils/utils.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

  Widget ddlMain(opcionSeleccionada, lista, cambiaOpc){
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: colorGray1, //Colors.grey[200],
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

  Widget ddlMainOut(opcionSeleccionada, lista, cambiaOpc,String deshabilitado){
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: colorGray1, //Colors.grey[200],
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

  Widget ddlFutureImg(opcionSeleccionada, lista, cambiaOpc){
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: colorGray1, //Colors.grey[200],
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

  Widget ddlFutureSearch(opcionSeleccionada, lista, cambiaOpc){
    try{
      return Material(
        borderRadius: borderRadius,
        color: colorGray1, //Colors.grey[200],
        elevation: 0.0,
        child: SearchableDropdown.single( 
          icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
          hint: "Seleccione raza",
          searchHint: "Seleccione raza",
          items: getOpcionesSearch(lista),
          value: opcionSeleccionada,              
          onChanged: cambiaOpc,
          isExpanded: true,
          closeButton: null,            
          displayClearIcon: false,
          underline: "",
        ),
      );
    }
    catch(ex){
      return LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
      );
    }
  }


  // Widget ddlFuture(opcionSeleccionada, lista, cambiaOpc){
  //   try{
  //     return Material(
  //       elevation: 0.0,
  //       borderRadius: borderRadius,
  //       color: Colors.grey[200],
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //         child: DropdownButtonHideUnderline(
  //           child: DropdownButton(
  //             icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
  //             isExpanded: true,
  //             value: opcionSeleccionada,
  //             items: getOpcionesFuture(lista),
  //             onChanged: cambiaOpc //(opt){ setState(() { opcionSeleccionada=opt; });},
  //           ),
  //         ),
  //       ), 
  //     );
  //   }
  //   catch(ex){
  //     return LinearProgressIndicator(
  //       backgroundColor: Colors.grey[200],
  //     );
  //   }
  // }
  
  // class DdlControl2 extends StatefulWidget {

//   final lista;
//   DdlControl2({@required this.lista});
//   @override
//   _DdlControl2 createState() => _DdlControl2(lista: lista);
// }
// class _DdlControl2 extends State<DdlControl2> {
//   final lista;
//   _DdlControl2({@required this.lista});
//   String _opcionSeleccionada='1'; 
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         elevation: 0.0,
//         borderRadius: borderRadius,
//         color: Colors.grey[200],
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton(
//               icon: Icon(Icons.keyboard_arrow_down,color: colorMain),
//               isExpanded: true,
//               value: _opcionSeleccionada,
//               items: getOpcionesDropdown(lista),
//               onChanged: (opt){
//                 setState(() {
//                   _opcionSeleccionada=opt;
//                 });
//               },
//             ),
//           ),
//         ), 
//       );
//   }
// }