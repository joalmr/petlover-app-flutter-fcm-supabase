import 'package:flutter/material.dart';
import 'package:proypet/src/utils/styles/styles.dart';



class FiltrosMapa extends StatefulWidget {
  final List<int> filtros;
  FiltrosMapa({@required this.filtros});
  @override
  _FiltrosMapaState createState() => _FiltrosMapaState(filtros: filtros);
}

class _FiltrosMapaState extends State<FiltrosMapa> {
  List<int> filtros;
  _FiltrosMapaState({@required this.filtros});
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final formKey = GlobalKey<FormState>();

  // String val= "";
    bool bool1=false;
    bool bool2=false;
    bool bool3=false;
    bool bool4=false;
    bool bool5=false;
    bool bool6=false;
    bool bool7=false;
    bool bool8=false;
    bool bool9=false;
    bool bool10=false;
    bool bool11=false;
    bool bool12=false;
    bool bool13=false;
    bool bool14=false;
    bool bool15=false;
    bool bool16=false;


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
              child: Form(
                key: formKey,
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
                    // buttonPri('Flitrar', ()
                    //   =>Navigator.pushNamedAndRemoveUntil(context, 'navLista', 
                    //     ModalRoute.withName("navLista"), arguments:{ "filtros":filtros } ),
                    // ),
                    FlatButton(
                      child: Container(
                        width: double.infinity,
                        child: Text('Flitrar', 
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorMain, 
                            fontWeight: FontWeight.bold),)),
                      onPressed: ()
                        =>Navigator.pushNamedAndRemoveUntil(context, 'navLista', ModalRoute.withName("navLista"), arguments:{ "filtros":filtros } ),
                    ),
                    SwitchListTile(                      
                      value: (filtros.contains(1)) ? true : false,//petReq.genre,
                      title: Text('Baños'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(1);
                        else filtros.add(1);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(2)) ? true : false,//petReq.genre,
                      title: Text('Consulta'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(2);
                        else filtros.add(2);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(3)) ? true : false,//petReq.genre,
                      title: Text('Cirugía'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(3);
                        else filtros.add(3);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(4)) ? true : false,//petReq.genre,
                      title: Text('Vacuna'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(4);
                        else filtros.add(4);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(5)) ? true : false,//petReq.genre,
                      title: Text('Servicio de trasnporte'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(5);
                        else filtros.add(5);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(6)) ? true : false,//petReq.genre,
                      title: Text('Electrocardiograma'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(6);
                        else filtros.add(6);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(7)) ? true : false,//petReq.genre,
                      title: Text('Laboratorio'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(7);
                        else filtros.add(7);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(8)) ? true : false,//petReq.genre,
                      title: Text('Emergencia 24 horas'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(8);
                        else filtros.add(8);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(9)) ? true : false,//petReq.genre,
                      title: Text('Hospedaje'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(9);
                        else filtros.add(9);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(10)) ? true : false,//petReq.genre,
                      title: Text('Petshop'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(10);
                        else filtros.add(10);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(11)) ? true : false,//petReq.genre,
                      title: Text('Desparasitación'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(11);
                        else filtros.add(11);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(12)) ? true : false,//petReq.genre,
                      title: Text('Ecografía'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(12);
                        else filtros.add(12);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(13)) ? true : false,//petReq.genre,
                      title: Text('Rayos x'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(13);
                        else filtros.add(13);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(14)) ? true : false,//petReq.genre,
                      title: Text('Resonancia'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(14);
                        else filtros.add(14);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(15)) ? true : false,//petReq.genre,
                      title: Text('Farmacia'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(15);
                        else filtros.add(15);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(16)) ? true : false,//petReq.genre,
                      title: Text('Hospitalización'),
                      activeColor: colorMain,
                      onChanged: (value)=> setState((){
                        if(!value) filtros.remove(16);
                        else filtros.add(16);
                      }),
                    ),
                    
                    //FormControl().buttonSec('Buscar',(){})
                    
                    // buttonPri('Filtrar',()=>{})
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}