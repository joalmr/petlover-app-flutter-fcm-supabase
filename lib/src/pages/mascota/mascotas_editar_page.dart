import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

final tipopet = [{'id':'1','name':'Gato',},{'id':'2','name':'Perro'}];

class MascotasEditarPage extends StatefulWidget {
  @override
  _MascotasEditarPageState createState() => _MascotasEditarPageState();
}

class _MascotasEditarPageState extends State<MascotasEditarPage> {
  MascotaModel mascotaEdit = new MascotaModel();
  MascotaReq petReq = new MascotaReq();
  bool btnBool = true;
  File foto;
  bool boolEdit;
  String fechaEdit = '';

  @override
  Widget build(BuildContext context) {
    final MascotaModel petData = ModalRoute.of(context).settings.arguments;
    if(petData!=null){ //editar
      mascotaEdit = petData;
      // datoPet=mascotaEdit.specieId.toString();
      petReq.specie = mascotaEdit.specieId;
      petReq.breed = mascotaEdit.breedId;
      if(mascotaEdit.genre==1) boolEdit=true;
      if(mascotaEdit.genre==0) boolEdit=false;
      fechaEdit = mascotaEdit.birthdate.toString().split(' ')[0];
    }

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
                  textForm('Nombre de mascota', Icons.pets, false, (value)=>petReq.name=value, TextCapitalization.words, mascotaEdit.name),
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