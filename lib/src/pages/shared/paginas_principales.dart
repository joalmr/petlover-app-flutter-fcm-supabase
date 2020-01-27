import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/_header.dart';

class PaginasPrincipalesPage extends StatelessWidget {
  // final Widget datosWidget;

  // PaginasPrincipalesPage({@required this.datosWidget});

  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          //_fondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(),
                
                SizedBox(height: 75.0,),

                //datosWidget,
                
              ],
            ),
          )
        ],        
      );
  }


}


  // Widget _fondo(){
  //   final fondo = Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     decoration: BoxDecoration(
  //       //color: Color.fromRGBO(250, 240, 240, 1.0),
  //     ),
  //   );

  //   final caja = Transform.rotate(
  //     angle: 0,
  //     child: Container(
  //       height: 120.0,
  //       width: 1000.0,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(30.0),
  //         color: colorMain,
  //       ),
  //     ),
  //   );

  //   return Stack(
  //     children: <Widget>[
  //       fondo,
  //       Positioned(
  //           top: 0,
  //           left: 0,
  //           child: caja,
  //         )
  //     ],
  //   );
  // }