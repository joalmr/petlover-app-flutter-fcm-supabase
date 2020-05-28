import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/model/maps/address.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:http/http.dart' as http;

class AddressMap extends StatefulWidget {
  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
  GoogleMapController _controller;
  final _prefs = new PreferenciasUsuario();
  String _mapStyle;
  bool mapToggle = false;
  var currentLocation;
  double lat;
  double lng;
  String direccionDelivery;
  List<Marker> marcador = [];

  @override
  void initState() {
    super.initState();

    lat = double.parse(_prefs.position.split(',')[0]);
    lng = double.parse(_prefs.position.split(',')[1]);

    Geolocator().getCurrentPosition().then((currloc){
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null,'Ingrese dirección', null),
      body: mapToggle ? Stack(
        children: <Widget>[
          _mapa(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _autocompleteAddress(),
          ),      
        ],
      )  : LinearProgressIndicator(backgroundColor: Colors.grey[200],),
    );
  }

  _mapa(){
    return GoogleMap(
      myLocationEnabled: true,
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
        zoom: 10.0
      ),
      markers: Set.from(marcador),
      onMapCreated: mapCreated,
    );
  }
  ///////////////////////////////////////
  void mapCreated(controller){
    setState(() {
      _controller = controller;
      _controller.setMapStyle(_mapStyle);
    });
  }
  ///////////////////////////////////////
  ///////////////////////////////////////
  _autocompleteAddress(){
    return Material(
      elevation: 0.0,
      borderRadius: borderRadius,
      color: colorGray1,
      child: DropdownSearch<Prediction>(
        hint: 'Ingrese dirección',
        isFilteredOnline: true,
        autoFocusSearchBox: true,
        showSearchBox: true,
        autoValidate: true,
        mode: Mode.MENU,             
        emptyBuilder: (context) => Center(
          child: Text('Dirección no encontrada'),
        ),          
        searchBoxDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Icon(Icons.location_on),
          border: InputBorder.none,
          filled: true,
          fillColor: colorGray1,
          focusColor: colorMain,
          hintText: 'Ingrese dirección'
        ), 
        dropDownSearchDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Icon(Icons.location_on,color: colorMain),
          border: InputBorder.none,
        ),
        onFind: (String filter) async {
          var response = await http.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
          var models = addressFromJson(response.body);
          return models.predictions;
        },
        onChanged: (Prediction data){
          direccionDelivery=data.name;
          marcador.clear();
          searchandNavigate();
        },
        // onSaved: (value)=>searchAddr,
      ),
    );
  }

  searchandNavigate(){
    Geolocator().placemarkFromAddress(direccionDelivery).then((result){
      if(result!=null){
        Position latlng = result[0].position;

        currentLocation = latlng;
        lat = latlng.latitude;
        lng = latlng.longitude;
        
        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(lat,lng),
          zoom: 16.0,
          bearing: 45.0,
          tilt: 45.0))
        );

        setState(() {
          marcador.add(
            Marker(
              markerId: MarkerId(lat.toString()),
              draggable: true,
              position: LatLng(lat,lng), 

            )
          );          
        });
        
      }      
    });
  }

}