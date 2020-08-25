import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proypet/src/controllers/veterinaria_controller/reserva_vet_controller.dart';

class MapaReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservaVetController>(
        id: 'xmap',
        builder: (_) {
          return GoogleMap(
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            mapToolbarEnabled: false,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
              ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer())),
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: LatLng(_.lat, _.lng), zoom: _.zoomIn),
            markers: Set.from(_.marcador),
            onMapCreated: _.mapCreated,
          );
        });
  }
}
