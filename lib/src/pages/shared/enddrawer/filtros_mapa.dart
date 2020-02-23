import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';



class FiltrosMapa extends StatelessWidget {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 32.0),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[                  
                  SizedBox(height: 40.0,),
                  Text('Filtros',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0,
                      letterSpacing: 3.0,
                      color: Colors.black54,                      
                    ),
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    child: Container(
                      width: double.infinity,
                      child: Text('Filtro 1'),
                    ),
                    onPressed: (){},
                  ),
                  Divider(color: divider,),
                  FlatButton(
                    child: Container(
                      width: double.infinity,
                      child: Text('Filtro 2'),
                    ),
                    onPressed: (){},
                  ),
                  SizedBox(height: 20.0,),
                  //FormControl().buttonSec('Buscar',(){})
                  buttonPri('Agregar mascota',()=>{})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}