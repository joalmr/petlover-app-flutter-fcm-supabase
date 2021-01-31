import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/components/appbar_menu.dart';
import 'package:proypet/src/app/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/establishment/establecimiento_short_model.dart';
import 'dart:ui' as ui;

class VetMapaPage extends StatefulWidget {
  final establecimientos;
  VetMapaPage({@required this.establecimientos});
  @override
  _VetMapaPageState createState() =>
      _VetMapaPageState(vetLocales: establecimientos);
}

class _VetMapaPageState extends State<VetMapaPage> {
  List<EstablishmentModelList> vetLocales;
  _VetMapaPageState({@required this.vetLocales});
  GoogleMapController _controller;
  // List<Marker> allMarkers = [];
  Set<Marker> allMarkers = Set.from([]);
  PageController _pageController;
  int prevPage;
  String _mapStyle;
  bool mapToggle = false;
  var currentLocation;
  BitmapDescriptor iconVet;
  BitmapDescriptor iconGro;
  // BitmapDescriptor mapMarker;

  Future<Uint8List> getBytesFromAsset(String path, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      allowUpscaling: true,
      targetHeight: height,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void setCustomMarker() async {
    // mapMarker = await BitmapDescriptor.fromAssetImage(
    //   ImageConfiguration(),
    //   'images/marker/marker-vet.png',
    // );
    var vet = await getBytesFromAsset('images/marker/marker-vet.png', 100);
    var gro = await getBytesFromAsset('images/marker/marker-groomer.png', 100);
    iconVet = BitmapDescriptor.fromBytes(vet);
    iconGro = BitmapDescriptor.fromBytes(gro);
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();

    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Mapa veterinarias', null),
      body: mapToggle
          ? FadeViewSafeArea(child: _onBody())
          : FadeViewSafeArea(
              child: Container(
                child: Center(
                  child: lottieLoading,
                ),
              ),
            ),
    );
  }

  Widget _onBody() {
    return Stack(
      children: <Widget>[
        FadeIn(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              gestureRecognizers: Set()
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    vetLocales[0].latitude,
                    vetLocales[0].longitude,
                  ),
                  zoom: 16.0),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
        ),
        Positioned(
          bottom: 25.0,
          child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: mapToggle
                  ? PageView.builder(
                      controller: _pageController,
                      itemCount: vetLocales.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _vetShopList(index);
                      },
                    )
                  : null),
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
        onTap: () => Get.toNamed('vetdetalle', arguments: vetLocales[index].id),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: double.maxFinite,
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
                child: Card(
                  child: _contenidoVet(vetLocales[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _contenidoVet(vetLocales) {
    return Row(
      children: [
        SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: colorGray1,
          backgroundImage: CachedNetworkImageProvider(vetLocales.logo),
          radius: 25.0,
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vetLocales.name,
                maxLines: 2,
                style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
              ),
              Text(
                vetLocales.address,
                maxLines: 3,
                style: Get.textTheme.subtitle2.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: colorYellow),
              Text(vetLocales.stars),
            ],
          ),
        )
      ],
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      _controller.setMapStyle(_mapStyle);

      for (var i = 0; i < vetLocales.length; i++) {
        allMarkers.add(Marker(
          icon: vetLocales[i].typeId == 1 ? iconVet : iconGro,
          markerId: MarkerId(vetLocales[i].name),
          draggable: false,
          onTap: () => _pageController.animateToPage(
            i,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
          position: LatLng(vetLocales[i].latitude, vetLocales[i].longitude),
        ));
      }
    });
  }

  moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(vetLocales[_pageController.page.toInt()].latitude,
              vetLocales[_pageController.page.toInt()].longitude),
          zoom: 16.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
