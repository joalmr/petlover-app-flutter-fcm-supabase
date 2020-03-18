import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_field.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

final raza = [{'cod':'1','nombre':'Cocker spaniel',},{'cod':'2','nombre':'Labrador'},{'cod':'3','nombre':'Pastor alemán'}];

class MascotasEditarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
            SingleChildScrollView(
              //padding: const EdgeInsets.only(top: 0.0,bottom: 0.0),
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBar(
                    backgroundColor: colorMain,
                    elevation: 0,
                    title: Text("Editar mascota",style: 
                      TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  //FormControl().textfield('Nombre de mascota', Icons.pets, false),
                  textfield('Nombre de mascota', Icons.pets, false),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                    child: Text('Seleccione raza'),
                  ),
                  //DdlControl(lista: raza),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                    child: Text('Fecha de nacimiento'),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                    child: Text('Foto de mi mascota'),
                  ),
                  SizedBox(height: 25.0,),
                  Center(
                    child: buttonPri('Guardar',(){}),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}