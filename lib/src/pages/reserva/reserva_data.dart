import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/booking/booking_model.dart';
import 'package:proypet/src/model/maps/address.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/shared/form_control/button_primary.dart';
import 'package:proypet/src/shared/form_control/ddl_control.dart';
import 'package:proypet/src/shared/form_control/text_field.dart';
import 'package:proypet/src/shared/snackbar.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
// import 'package:search_map_place/search_map_place.dart';

String direccionDelivery="";

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
  final formKey = GlobalKey<FormState>();
  TextEditingController _inputDireccionController=new TextEditingController();

  final bookingProvider = BookingProvider();
  final mascotaProvider = MascotaProvider();
  BookingModel booking =BookingModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _prefs = new PreferenciasUsuario();
  
  List _atencion = [
    {'id':'1','name':'Consulta',},
    {'id':'7','name':'Chequeo preventivo',},
    {'id':'4','name':'Desparasitación',},
    {'id':'2','name':'Vacuna',},    
    {'id':'3','name':'Baño',},    
    {'id':'5','name':'Baño y corte',},
    {'id':'6','name':'Otro servicio',},    
  ];
  
  List _delivery = [
    {'id':'1','name':'No deseo',},
    {'id':'2','name':'Recojo y entrega a domicilio',},
    {'id':'3','name':'Solo recojo a domicilio',},
    {'id':'4','name':'Solo entrega a domicilio',},
  ];

  String resarvaId = "1";
  String deliveryId = "1";
  String observacion="";
  bool boolPet=false;
  bool clickReservar = true;

  GoogleMapController _controller;
  String _mapStyle;
  List<Marker> marcador = [];
  double lat=0;
  double lng=0;
  double zoomIn=10.0;

  //direccion de delivery
  @override
  void initState() {
    _inputDireccionController.text = _prefs.myAddress;
    print(_prefs.myAddressLatLng);
    if(_prefs.myAddressLatLng.toString().trim() !=""){
      setState(() {
        lat = double.parse(_prefs.myAddressLatLng.split(',')[0]);
        lng = double.parse(_prefs.myAddressLatLng.split(',')[1]);
        zoomIn=16.0;
        marcador.add(Marker(markerId: MarkerId("1"), position: LatLng(lat,lng), draggable: true));        
      });
    }

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null,'Reservar servicio', null),
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
            Text('Servicio'),
            ddlMain(resarvaId, _atencion, 
              (opt){ setState(() {
                  resarvaId=opt; 
              });}
            ), 
            SizedBox(height: 12.0,),
            Text('Fecha'),
            _crearFecha(context),
            SizedBox(height: 12.0,),
            Text('Hora'),
            _crearHora(context),                       
            delivery ? SizedBox(height: 12.0,) : SizedBox(height: 0.0,) ,
            delivery ? Text('Movilidad') : SizedBox(height: 0.0,) ,
            delivery ? ddlMain(deliveryId, _delivery, 
              (opt){ setState(() {
                  deliveryId=opt; 
              });}
            )  : SizedBox(height: 0.0,) ,
            (delivery && deliveryId!="1") ? Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                _direccion(),
                SizedBox(height: 5.0,),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  child: _mapa(),
                )
              ],
            ) : SizedBox(height: 0.0,) ,
            SizedBox(height: 12.0,),
            Text('Observación'),
            textfieldArea(_inputObservacioController,'Ingrese observación (opcional)',null,null),
            Text.rich(
              TextSpan(
                text: '*Si seleccionó ', // default text style
                children: <TextSpan>[
                  TextSpan(text: 'Otro servicio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ', especifíquelo en observaciones',style: TextStyle()),
                ],
              ),
              style: TextStyle(fontSize: sizeH5),
            ),
            SizedBox(height: 20.0,),
            
            buttonPri('Confirmar reserva', clickReservar ? reservaDialog : null ),      
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

  Widget _direccion(){ //MyAddressBloc bloc
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: colorGray1,
      child: SimpleAutocompleteFormField<Prediction2>(
        controller: _inputDireccionController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Icon(Icons.location_on,color: colorMain),
          border: InputBorder.none,
        ),
        // suggestionsHeight: 100.0,
        maxSuggestions: 5,
        onSearch: (filter) async {
          var response = await http.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
          var models = addressFromJson(response.body);
          return models.predictions;
        },
        autocorrect: true,
        autovalidate: true,

        onChanged: (Prediction2 data){
          direccionDelivery=data.name;
          searchandNavigate(data);
        },
        itemBuilder: (context, address) => Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
          child: Text(address.name,style: TextStyle(fontWeight: FontWeight.bold))
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
          hintStyle: TextStyle(fontSize: sizeH4),
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
      // locale: Locale('es','ES'),
      firstDate: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day), 
      lastDate: new DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day),
    );

    if(picked!=null){
      final f = new DateFormat('yyyy-MM-dd'); // DateFormat('yyyy-MM-dd');
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
          hintStyle: TextStyle(fontSize: sizeH4),
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
            if(initialtimer.toString().split(':')[0].length==1){
              _hora = '0'+initialtimer.toString().split(':00.')[0];
            }
            else _hora = initialtimer.toString().split(':00.')[0];
            _inputHoraController.text = _hora;
          }          
        });
      },
    );
  }

  reservaDialog() async {
    setState(() {
      clickReservar = false;      
    });

    if(_inputFechaController.text=="" || _inputHoraController.text=="" ){
      mostrarSnackbar('Debe ingresar fecha y hora de la reserva', colorRed, scaffoldKey);
      Timer(Duration(milliseconds: 1500), (){
        setState(() { clickReservar = true; });
      });
    }

    else{
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      var fechaTime = DateTime.parse(_inputFechaController.text+" "+_inputHoraController.text);
      String fechaTimeAt = DateFormat('yyyy-MM-dd kk:mm:ss').format(fechaTime);
      
      if(formattedDate == fechaTimeAt.split(' ')[0] && fechaTime.hour<(now.hour-1)){
        mostrarSnackbar('La hora debe ser mayor', colorRed, scaffoldKey);
        Timer(Duration(milliseconds: 1500), (){
          setState(() { clickReservar = true; });
        });
      }
      else{
        booking.bookingAt = fechaTimeAt;
        booking.establishmentId = widget.establecimientoID;
        booking.petId = mascotaID;//
        booking.typeId = resarvaId;
        booking.observation= _inputObservacioController.text;

        var deliveryArray = [null, 'Recojo y entrega a domicilio', 'Solo recojo a domicilio', 'Solo entrega a domicilio'];
        var deliveryText = "";
        var direccionText="";
        if(delivery==true && deliveryId!="1"){
          deliveryText = deliveryArray[int.parse(deliveryId)-1];
          direccionText = direccionDelivery.toString();//_inputDireccionController.text;
        }
        if( delivery==true && deliveryId!="1" && direccionText.trim()=="" && _inputDireccionController.text.trim()=="" ){
          setState(() { clickReservar = true; });
          mostrarSnackbar('Debe ingresar la dirección para el servicio de movilidad', colorRed, scaffoldKey);
        }
        else{
          bool resp = await bookingProvider.booking(booking, deliveryText, direccionText);

          if(resp){
            showDialog(context: context,builder: 
            (BuildContext context)=> FadeIn(
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                content: Container(
                  height: 100.0,
                  child: Center(child: Text('Gracias por su reserva.', style: TextStyle(fontSize: sizeH4),))
                ),
              ),
            ), barrierDismissible: false );
            Timer(Duration(milliseconds: 2000), ()=> Navigator.of(context).pushNamedAndRemoveUntil('/navInicio', ModalRoute.withName('/navInicio')));
          }
        }
        
      }
    }
  }

///////////////////////////////////////////////////
  searchandNavigate(Prediction2 dato) async {
    final places = new GoogleMapsPlaces(apiKey: keyMap);
    places.getDetailsByPlaceId(dato.placeId).then((value) {
      marcador.clear();
      Location latlng = value.result.geometry.location;
      lat = latlng.lat;
      lng = latlng.lng;

      _prefs.myAddressLatLng = "$lat,$lng";
          
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat,lng), zoom: 16.0, bearing: 45.0, tilt: 45.0))
      );
      
      _prefs.myAddress = dato.name;
      _inputDireccionController.text = dato.name;
      setState(() {
        marcador.add(Marker(markerId: MarkerId("1"), position: LatLng(lat,lng), draggable: true));
      });
    });

  }

  _mapa(){
    return GoogleMap(
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      compassEnabled: false,              
      gestureRecognizers:Set()
      ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
      ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
      ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
      ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      zoomGesturesEnabled: true,
      tiltGesturesEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(lat,lng),
        zoom: zoomIn
      ),
      markers: Set.from(marcador),
      onMapCreated: mapCreated,
    );
  }

  void mapCreated(controller){
    setState(() {
      _controller = controller;
      _controller.setMapStyle(_mapStyle);
    });
  }
}