import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/ddl_control.dart';
import 'package:proypet/src/pages/shared/form_control.dart';

final tipopet = [{'cod':'1','nombre':'Perro',},{'cod':'2','nombre':'Gato'}];
final raza = [{'cod':'1','nombre':'Cocker spaniel',},{'cod':'2','nombre':'Labrador'},{'cod':'3','nombre':'Pastor alemán'}];

class MascotaAgregarPage extends StatelessWidget {
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
                    centerTitle: true,
                    title: Text("Agregar mascota",style: 
                      TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  FormControl().textfield('Nombre de mascota', Icons.pets, false),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                    child: Text('Seleccione tipo de mascota'),
                  ),
                  DdlControl(lista: tipopet),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                    child: Text('Seleccione raza'),
                  ),
                  DdlControl(lista: raza),
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
                  Center(child: FormControl().buttonSec('Agregar mascota',(){}))
                ],
              ),
            ),
        ],
      ),
    );
  }
}