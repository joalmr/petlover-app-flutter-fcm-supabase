import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/reserva_detalle_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proypet/src/pages/shared/appbar_menu.dart';


class ReservaMapaPage extends StatefulWidget {
  final establecimientos;
  ReservaMapaPage({@required this.establecimientos});
  @override
  _ReservaMapaPageState createState() => _ReservaMapaPageState(vetLocales: establecimientos);
}

class _ReservaMapaPageState extends State<ReservaMapaPage> {
  List<EstablecimientoModel> vetLocales;
  _ReservaMapaPageState({@required this.vetLocales});
  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;
  String _mapStyle;
  bool mapToggle = false;
  var currentLocation;
  
  @override
  void initState() {
    //implement initState
    super.initState();

    Geolocator().getCurrentPosition().then((currloc){
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    vetLocales.forEach((element) {
      allMarkers.add(Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        infoWindow: InfoWindow(
          title: element.name, 
          snippet: '★ ${element.stars} (${element.votes})',//element.direccion,
          onTap: ()=>Navigator.push(context, MaterialPageRoute(
            builder: (_)=>ReservaDetallePage(vet: element),
          )),
        ),
        position: LatLng(element.latitude,element.longitude), //element.locationCoords,
        ));
    });
    
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null,'Mapa Establecimientos', null),
      body: _onBody(),
    );
  }

  Widget _onBody(){
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,//MediaQuery.of(context).size.height,
          width: double.infinity,//MediaQuery.of(context).size.width,
          child: mapToggle ? GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,              
            gestureRecognizers:Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(vetLocales[0].latitude,vetLocales[0].longitude),//vetLocales[0].locationCoords, 
              zoom: 16.0
            ),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ) : Container(
            color: Colors.white,
            child: Container(
              color: Color(0xFFfcfefc),
              child: Center(
                child: CircularProgressIndicator()
                // child: ClipRect(
                //   child: Image.asset('images/dog_loading.gif',
                //     height: 145.0,
                //     width: 145.0,
                //   ),
                // )                  
              ),
            ),
          )
        ),
        Positioned(
          bottom: 25.0,
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: mapToggle ? PageView.builder(
              controller: _pageController,
              itemCount: vetLocales.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _vetShopList(index);
              },
            ) : null
          ),
        )         
      ],
    );
  }
  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _vetShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 140.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(
            builder: (_)=>ReservaDetallePage(vet: vetLocales[index]),
          )),
          child: Stack(children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ]),
                child: Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Row(children: [
                      Container(
                        height: 90.5,
                        width: 90.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(vetLocales[index].logo),
                            fit: BoxFit.cover))),
                      SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0,),
                          Text(
                            vetLocales[index].name,//nombreVet(index),
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 170.0,
                            child: Text(
                              vetLocales[index].description,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ])
                        ]))))
          ])),
    );
  }
///////////////////////////////////////
  void mapCreated(controller){
    setState(() {
      _controller = controller;
      _controller.setMapStyle(_mapStyle);
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(vetLocales[_pageController.page.toInt()].latitude, vetLocales[_pageController.page.toInt()].longitude), //vetLocales[_pageController.page.toInt()].locationCoords,
      zoom: 16.0,
      bearing: 45.0,
      tilt: 45.0))
    );
  }
  
  // nombreVet(index){
  //   if(vetLocales[index].name.length>30){
  //     return vetLocales[index].name.substring(0,29);
  //   }
  //   else{
  //     return vetLocales[index].name;
  //   }
  // }
}