import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/ddl_control.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_field.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';

final tipopet = [{'cod':'1','nombre':'Perro',},{'cod':'2','nombre':'Gato'}];
final raza = [{'cod':'1','nombre':'Cocker spaniel',},{'cod':'2','nombre':'Labrador'},{'cod':'3','nombre':'Pastor alemán'}];

class MascotaAgregarPage extends StatefulWidget {
  @override
  _MascotaAgregarPageState createState() => _MascotaAgregarPageState();
}

class _MascotaAgregarPageState extends State<MascotaAgregarPage> {
  String _fecha ='';
  final _shape = BorderRadius.circular(10.0);
  TextEditingController _inputFechaController=new TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final mascotaProvider = new MascotaProvider();

  bool btnBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar2(
        null,
        Text('Agregar mascota',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        null
      ),
      body: Stack(
        children: <Widget>[
            SingleChildScrollView(
              //padding: const EdgeInsets.only(top: 0.0,bottom: 0.0),
              child: Form(
                child: Column(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // appbar2(
                    //   null,
                    //   Text('Agregar mascota',
                    //     style: TextStyle(
                    //       fontSize: 16.0,
                    //       fontWeight: FontWeight.normal
                    //     ),
                    //   ),
                    //   null
                    // ),
                    SizedBox(height: 25.0,),
                    
                    textfield('Nombre de mascota', Icons.pets, false),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: _crearFecha(context),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: Text('Foto de mi mascota'),
                    ),
                    
                    SizedBox(height: 25.0,),
                    Center(
                      child: buttonPri('Agregar mascota', btnBool ? _onAdd : null ) //()=>agregarDialog()
                    ),
                    //Center(child: FormControl().buttonSec('Agregar mascota',()=>agregarDialog()))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  

  Widget _crearFecha(BuildContext context){
    return Material(
      elevation: 0.0,
      borderRadius: _shape,
      color: Colors.grey[200],
      child: TextField(
        enableInteractiveSelection: false,
        controller: _inputFechaController,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
        cursorColor: colorMain,
        decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            //elevation: 0.0,
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              Icons.calendar_today,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      //firstDate: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day), 
      firstDate: new DateTime(DateTime.now().year-25),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year
    );

    if(picked!=null){
      final f = new DateFormat('yyyy-MM-dd');
      setState(() {
        _fecha= f.format(picked);
        _inputFechaController.text = _fecha;
      });
    }
  }

  // agregarDialog(){
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context){
  //       return AlertDialog(
  //         content: Container(
  //           child: Text('Mascota agregada con éxito.')
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: new Text("Lista"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),                            
  //           FlatButton(
  //             child: new Text("Ir a inicio"),
  //             onPressed: () {
  //               Navigator.pushReplacement(
  //                 context,MaterialPageRoute(
  //                   builder: (context) => NavigationBar(currentTabIndex: 1,)
  //               ));
  //             },
  //           ),
  //         ],
  //       );
  //     }
  //   ); 
  // }

  void _onAdd() async {
    setState(() {
      btnBool = false;      
    });
    
    MascotaReq petDato = new MascotaReq();
    //final f = new DateFormat('yyyy-MM-dd');

    petDato.name = 'Pruebin 3';
    petDato.birthdate = '2019-12-12';
    petDato.specie = 1;
    petDato.breed = 1;
    petDato.genre = 1;

    final resp = await mascotaProvider.savePet(petDato);

    if(resp){
      mostrarSnackbar('Mascota agregada.', Colors.green[300]);  
      //Navigator.of(context).pushReplacementNamed('mismascotas');   
      Timer(
        Duration(milliseconds: 2500), (){
          Navigator.of(context).pushReplacementNamed('mismascotas');   
          // setState(() {
          // });
        }
      );
    
    }
    else setState(() {
      btnBool = true;      
    });

  }
  //Colors.red[300]
  void mostrarSnackbar(String mensaje, Color color){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 2500),
      backgroundColor: color,
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
    
  }
}