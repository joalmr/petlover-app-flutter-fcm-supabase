import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proypet/src/pages/model/vet_model.dart';
import 'package:proypet/src/pages/reserva_detalle_page.dart';


class ReservaMapaPage extends StatefulWidget {
  @override
  _ReservaMapaPageState createState() => _ReservaMapaPageState();
}

class _ReservaMapaPageState extends State<ReservaMapaPage> {
  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;
  
  nombreVet(index){
    if(vetLocales[index].nombre.length>30){
      return vetLocales[index].nombre.substring(0,29);
    }
    else{
      return vetLocales[index].nombre;
    }
  }

  @override
  void initState() {
    //implement initState
    super.initState();
    vetLocales.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.nombre),
          draggable: false,
          infoWindow: InfoWindow(title: element.nombre, snippet: element.direccion),
          position: element.locationCoords, ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Establecimientos'),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,//MediaQuery.of(context).size.height,
              width: double.infinity,//MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(-12.013286, -77.101933), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: vetLocales.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _vetShopList(index);
                  },
                ),
              ),
            )         
        ],
      ),
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
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(
            builder: (_)=>ReservaDetallePage(),
          )),
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
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
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(vetLocales[index].logo),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  //vetLocales[index].nombre,
                                  nombreVet(index),
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  vetLocales[index].direccion,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    vetLocales[index].descripcion,
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
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: vetLocales[_pageController.page.toInt()].locationCoords,
        zoom: 16.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
  
}