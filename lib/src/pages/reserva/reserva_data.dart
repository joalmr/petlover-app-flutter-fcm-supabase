import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:proypet/src/model/booking/booking_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/ddl_control.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/pages/shared/form_control/text_field.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/providers/mascota_provider.dart';

class DataReserva extends StatefulWidget {
  final String establecimientoID;
  final String establecimientoName;
  final List<MascotaModel> misMascotas;
  final String mascotaID;
  final bool delivery;
  DataReserva({@required this.establecimientoID, @required this.misMascotas, @required this.mascotaID, @required this.establecimientoName, @required this.delivery});
  @override
  _Data createState() => _Data(establecimientoID: establecimientoID,misMascotas: misMascotas,mascotaID: mascotaID, establecimientoName: establecimientoName, delivery: delivery); //establecimientoID: this.establecimientoID,misMascotas: this.misMascotas
}

class _Data extends State<DataReserva> {
  String establecimientoID;
  String establecimientoName;
  List<MascotaModel> misMascotas;
  String mascotaID;
  bool delivery;
  _Data({@required this.establecimientoID, this.misMascotas, this.mascotaID, this.establecimientoName, this.delivery});
  
  String _fecha ='';
  String _hora ='';
  TextEditingController _inputFechaController=new TextEditingController();
  TextEditingController _inputHoraController=new TextEditingController();
  TextEditingController _inputObservacioController=new TextEditingController();
  TextEditingController _inputDireccionController=new TextEditingController();

  final bookingProvider = BookingProvider();
  final mascotaProvider = MascotaProvider();
  BookingModel booking =BookingModel();
  
  List _atencion = [
    {'id':'1','name':'Consulta',},
    {'id':'2','name':'Vacuna',},
    {'id':'3','name':'Baño',},
    {'id':'4','name':'Desparasitación',},
  ];
  
  List _delivery = [
    {'id':'1','name':'No deseo',},
    {'id':'2','name':'Recojo y entrega',},
    {'id':'3','name':'Recojo',},
    {'id':'4','name':'Entrega',},
  ];

  String resarvaId = "1";
  String deliveryId = "1";
  String observacion="";
  bool boolPet=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null,'Reserva', null),
      body: _onFuture(),
    );
  }

  Widget _onFuture(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(establecimientoName, 
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),            
            ),
            SizedBox(height: 20.0,),
            Text('Mascota'),         
            ddlFutureImg(mascotaID, misMascotas, (opt){ setState(() { mascotaID=opt.toString(); });} ),
            SizedBox(height: 12.0,),
            Text('Fecha'),
            _crearFecha(context),
            SizedBox(height: 12.0,),
            Text('Hora'),
            _crearHora(context),
            SizedBox(height: 12.0,),
            Text('Atención'),
            ddlMain(resarvaId, _atencion, 
              (opt){ setState(() {
                  resarvaId=opt; 
              });}
            ),            
            delivery ? SizedBox(height: 12.0,) : SizedBox(height: 0.0,) ,
            delivery ? Text('Delivery') : SizedBox(height: 0.0,) ,
            delivery ? ddlMain(deliveryId, _delivery, 
              (opt){ setState(() {
                  deliveryId=opt; 
              });}
            )  : SizedBox(height: 0.0,) ,
            (delivery && deliveryId!="1") ? Padding(
              padding: const EdgeInsets.only(top: 10.0) ,
              child: textfieldArea(_inputDireccionController,'Ingrese dirección para el delivery',null,null),
            ) : SizedBox(height: 0.0,) ,
            SizedBox(height: 12.0,),
            Text('Observación'),
            textfieldArea(_inputObservacioController,'Ingrese observación (opcional)',null,null),
            SizedBox(height: 20.0,),
            buttonPri('Reservar', ()=>reservaDialog()),      
            SizedBox(height: 5.0),
            FlatButton(
              child: new Text("Cancelar",style: TextStyle(color: colorMain)),
              onPressed: () {
                Navigator.of(context).pop();
              },            
            ),
          ],
        ),
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
      lastDate: new DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day),
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
                height: 275.0,
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

  reservaDialog() async {
    if(_inputFechaController.text=="" || _inputHoraController.text=="" ){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return FadeIn(
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: Text('Error'),
              content: Text('Debe ingresar fecha y hora de la reserva.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: ()=>Navigator.pop(context), 
                  child: Text('Continuar')
                ),
              ],
            ),
          );
        }
      );
    }

    else{
      var fechaTime = _inputFechaController.text+" "+_inputHoraController.text+":00";

      booking.bookingAt = fechaTime;
      booking.establishmentId = widget.establecimientoID;
      booking.petId = mascotaID;//
      booking.typeId = resarvaId;
      booking.observation= _inputObservacioController.text;

      var deliveryArray = ['', 'Recojo y entrega', 'Recojo', 'Entrega'];
      var deliveryText = "";
      var direccionText="";
      if(delivery){
        deliveryText = deliveryArray[int.parse(deliveryId)-1];
        direccionText = _inputDireccionController.text;
      }

      bool resp = await bookingProvider.booking(booking, deliveryText, direccionText);

      if(resp){
        showDialog(context: context,builder: 
        (BuildContext context)=> FadeIn(
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            content: Container(
              height: 100.0,
              child: Center(child: Text('Gracias por su reserva.', style: TextStyle(fontSize: 14.0),))
            ),
          ),
        ), barrierDismissible: false );
        Timer(Duration(milliseconds: 2000), ()=> Navigator.of(context).pushNamedAndRemoveUntil('/navInicio', ModalRoute.withName('/navInicio')));
      } 
    }
  }
}