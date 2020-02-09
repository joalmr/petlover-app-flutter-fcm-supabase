import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/ddl_control.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:intl/intl.dart';

//final _shape = BorderRadius.circular(100.0);

class DataReserva extends StatefulWidget {
  @override
  _Data createState() => _Data();
}

class _Data extends State<DataReserva> {
  String _fecha ='';
  String _hora ='';
  TextEditingController _inputFechaController=new TextEditingController();
  TextEditingController _inputHoraController=new TextEditingController();
  List _mascota = [
    {'cod':'1','nombre':'Greco',},
    {'cod':'2','nombre':'Pirulin',},
    {'cod':'3','nombre':'Tito',},
  ];

  List _atencion = [
    {'cod':'1','nombre':'Consulta',},
    {'cod':'2','nombre':'Vacuna',},
    {'cod':'3','nombre':'Baño',},
    {'cod':'4','nombre':'Desparasitación',},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Mascota'),
          DdlControl2(lista: _mascota),
          SizedBox(height: 10.0,),
          Text('Fecha'),
          _crearFecha(context),
          SizedBox(height: 10.0,),
          Text('Hora'),
          _crearHora(context),
          // MaterialButton(
          //   child: Text("Cupertino"),
          //   color: Colors.greenAccent,
          //   onPressed: () {
          //     showModalBottomSheet(
          //       context: context,
          //       builder: (BuildContext builder) {
          //         return Container(
          //             height: MediaQuery.of(context).copyWith().size.height / 3,
          //             child: time());
          //       }
          //     );
          //   },
          // ),
          SizedBox(height: 10.0,),
          // MaterialButton(
          //   child: Text(
          //     "Cupertino date Picker",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   color: Colors.redAccent,
          //   onPressed: () {
          //     showModalBottomSheet(
          //       context: context,
          //       builder: (BuildContext builder) {
          //         return Container(
          //           height:MediaQuery.of(context).copyWith().size.height/3,
          //           child: datetime()
          //         );
          //       }
          //     );
          //   },
          // ),
          Text('Atención'),
          DdlControl2(lista: _atencion),
          SizedBox(height: 20.0,),
          FormControl().buttonSec('Reservar', (){
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  content: Container(
                    child: Text('Reserva realizada con éxito.')
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: new Text("Ir a inicio"),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,MaterialPageRoute(
                            builder: (context) => NavigationBar(currentTabIndex: 1,)
                        ));
                      },
                    ),
                  ],
                );
              }
            );   
          }),          
          SizedBox(height: 5.0),
          FlatButton(
            child: new Text("Cancelar",style: TextStyle(color: colorMain)),
            onPressed: () {
              Navigator.of(context).pop();
            },            
          ),
        ],
      ),
    );
  }

  final _shape = BorderRadius.circular(10.0);
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
          hintText: 'Fecha de atención',
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
      firstDate: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day), 
      lastDate: new DateTime(DateTime.now().year+1),
    );

    if(picked!=null){
      final f = new DateFormat('yyyy-MM-dd');
      setState(() {
        _fecha= f.format(picked);
        _inputFechaController.text = _fecha;
      });
    }
  }

  Widget _crearHora(BuildContext context){
    return Material(
      elevation: 0.0,
      borderRadius: _shape,
      color: Colors.grey[200],
      child: TextField(
        enableInteractiveSelection: false,
        controller: _inputHoraController,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    _time(),
                    FlatButton(
                      child: new Text("Cerrar",style: TextStyle(color: colorMain)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },            
                    ),
                  ],
                )
              );
            }
          );
          //_selectHour(context);
        },
        cursorColor: colorMain,
        decoration: InputDecoration(
          hintText: 'Hora de atención',
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              Icons.access_time,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ),
      ),
    );
  }
  //  _selectHour(BuildContext context) async {
  //   TimeOfDay pickedHora = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (BuildContext context, Widget child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
  //         child: child,
  //       );
  //     },
  //   );

  //   if(pickedHora!=null){
  //     setState(() {
  //       _hora= pickedHora.format(context); //f.format(pickedHora);
  //       _inputHoraController.text = _hora;
  //     });
  //   }
  // }
  Duration initialtimer = new Duration();

  Widget _time() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 10,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          if(initialtimer!=null){
            _hora = initialtimer.toString().split(':00.')[0];//.format(context); //f.format(pickedHora);
            _inputHoraController.text = _hora;
          }          
        });
      },
    );
  }

  // Widget datetime() {
  //   return CupertinoDatePicker(
  //     initialDateTime: DateTime.now(),
  //     onDateTimeChanged: (DateTime newdate) {
  //       print(newdate);
  //     },
  //     use24hFormat: false,
  //     minimumDate: DateTime.now(),
  //     maximumDate: new DateTime(DateTime.now().year+1),
  //     minimumYear: DateTime.now().year,
  //     maximumYear: DateTime.now().year+1,
  //     minuteInterval: 1,
  //     mode: CupertinoDatePickerMode.dateAndTime,
  //   );
  // }

}